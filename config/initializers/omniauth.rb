Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :vkontakte, ENV['VK_KEY'], ENV['VK_SECRET']
  provider :identity, on_failed_registration: lambda { |env|    
    IdentitiesController.action(:new).call(env)
end