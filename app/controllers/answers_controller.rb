class AnswersController < ApplicationController
	@task_answering 
  @user_answering

  def new
  	@task_answering = Task.find(params[:task_id])
  	@user_answering = User.find(session[:user_id])
  	@answer = Answer.new(:task => @task_answering, :user => @user_answering, :correct => false)
  end

  def create
  	@answer = Answer.new(:task => @task_answering, :user => @user_answering, :correct => false)
  	@answer.update(answer_params)
  	if @answer.save
    else
      render :action => 'new'
    end
  end

  private

	  def answer_params
	    params.require(:answer).permit(:content, :user, :task)
	  end
end
