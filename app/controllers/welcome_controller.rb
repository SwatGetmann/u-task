class WelcomeController < ApplicationController
  def index
  	@tasks = Task.order(rating: :desc).limit(10)
  	@users = User.order(rating: :desc).limit(10)
  	@tags = Task.tag_counts_on(:tags)
  end

  def tag
  end
end
