class AnswersController < ApplicationController
  def create
  	@task = Task.find(params[:task_id])
  	@user = User.find(params[:user_id])
  	@answer = Answer.new(:content => params[:content], :user => @user, :task => @task, :correct => correct_answer?(:content, @task.answer))
  	@answer.save
  end

  def new
  	@task = Task.find(params[:task_id])
  	@user = current_user
  	@answer = Answer.new
  end

private
  	def correct_answer?(users_answer, correct_answer)
		return users_answer == correct_answer
	end
end
