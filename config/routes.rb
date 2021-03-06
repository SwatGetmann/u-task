Rails.application.routes.draw do

  resources :tasks do
    get :autocomplete_tag_name, :on => :collection
    collection do
      match :search, via: [:get, :post]
    end
  end
  resources :sessions

  get 'admin' => 'admin#index'

  get 'sessions/create'
  get "sessions/destroy"

  get 'tags/:tag', to: 'welcome#index', as: :tag
  
  match 'welcome/index', via: [:get, :post]

  scope '(:locale)' do
    resources :levels
    resources :categories
    resources :tasks
    resources :users do
      resources :tasks do
        get "/answer", to: "answers#new"
        post "/answer", to: "answers#create"
      end
    end

    get "/signout" => "sessions#destroy", :as => :signout

    match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
    match "/auth/failure", to: "sessions#failure", via: [:get, :post]
    resources :identities

    controller :sessions do
      get 'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
    end

    root 'welcome#index', via: [:get, :post]
  end


  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
