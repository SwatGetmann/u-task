class AnswersController < ApplicationController
  def new
  	@task = Task.find(params[:task_id])
  	@user = User.find(session[:user_id])
  	@answer = Answer.new(:task => @task, :user => @user, :correct => false)
  end

  def create
  	@answer = Answer.new(:task => @task, :user => @user, :correct => false)
  	@answer.update(answer_params)
  	@asnwer.user = @user
  	@answer.task = @task
  	if @book.save
      redirect_to root
    else
      render :action => 'new'
    end
  end

  private

	  def answer_params
	    params.require(:answer).permit(:content, :user, :task)
	  end
end
