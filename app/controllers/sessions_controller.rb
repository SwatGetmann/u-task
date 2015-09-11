class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:email])
		if user and user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to admin_url
		else
			redirect_to login_url, alert: "Inavlid user|password combination"
		end
	end
	
	def create_by_provider
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to edit_user_path(id: user.id), :notice => "Signed in!"
  end

	def destroy
	  session[:user_id] = nil
	  redirect_to :back, :notice => "Signed out!"
	end
	
end
