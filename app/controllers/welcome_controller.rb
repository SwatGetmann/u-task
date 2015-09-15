class WelcomeController < ApplicationController
  def index
  	@tasks = Task.order(rating: :desc).limit(10)
  	@users = User.order(rating: :desc).limit(10)
  end
end
