class WelcomeController < ApplicationController
  def index
  	if params[:tag]
    	@tasks = Task.tagged_with(params[:tag]).order(rating: :desc).limit(10)
 	 	else
   	 	@tasks = Task.order(rating: :desc).limit(10)
 	 	end

  	# @tasks = Task.order(rating: :desc).limit(10)
  	@users = User.order(rating: :desc).limit(10)
  	@tags = Task.tag_counts_on(:tags)
  end

  def tag
  end
end
