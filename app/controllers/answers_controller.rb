class AnswersController < ApplicationController
  def create
  	@task = Task.find(params[:task_id])
  	@user = current_user
  	@answer = Answer.new(:content=> params[:answer][:content], :user => @user, :task => @task)
    @answer.save
    @answer.correct = correct_answer?(@answer.content, @answer.task.answer)
    if @answer.correct
      @user.rating += @answer.task.level.value
      @task.rating += 1
      @task.save!
      @user.save!
    end
    @answer.save!
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

    def answer_params
      params.require(:answer).permit(:content, :task_id)
    end
end
