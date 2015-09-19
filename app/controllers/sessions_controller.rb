class SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: :create
	
	def new
  end

  def create
    if params[:provider] == "identity"
      user = User.from_identity(params)
    else
      user = User.from_omniauth(env["omniauth.auth"])
    end
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to :back, alert: "Authentication failed, please try again."
  end
	
end
