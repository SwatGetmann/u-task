class WelcomeController < ApplicationController
  def index
  	@tasks = Task.all
  	@users = User.all
  end
end
