class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  autocomplete :tag, :name, :class_name => 'ActsAsTaggableOn::Tag', :full => true

  # GET /tasks
  # GET /tasks.json
  def index
    if params[:user_id]
      @tasks = Task.where(user_id: params[:user_id]).paginate(:page => params[:page], :per_page => 2)
    else
      @tasks = Task.all.paginate(:page => params[:page], :per_page => 2)
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @answer = Answer.new(:user_id => session[:user_id], :task_id => @task.id)
  end

  # GET /tasks/new
  def new
    @user = User.where(id: params[:user_id])
    @task = Task.new(user_id: params[:user_id])
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.rating = 0
    @task.user = User.find(session[:user_id])
    # @answer.new(params[:task][:answers])  # hell
    # @task.user ||= User.find(params[:user_id])      WTF?!

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @tasks = Task.search do
      fulltext params[:query] do
        query_phrase_slop 1
      end
    end.results

    respond_to do |format|
      format.html { render :action => "index", :controller => :tasks }
      format.xml { render :xml => @tasks }
    end
  end

  def answer
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @user.answers.build
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit!
    end
end
