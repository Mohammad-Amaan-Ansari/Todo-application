class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to user_tasks_path(current_user), notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to user_task_path(current_user, @task), notice: "Task was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to user_tasks_path(current_user), notice: 'Task was successfully destroyed.' }
      format.js   # This responds to JavaScript (AJAX) requests
    end
  end

  def toggle_status
  @task = Task.find(params[:id])

    if @task.pending?
      @task.complete!
    else
      @task.pending!
    end

    respond_to do |format|
      format.html { redirect_to user_tasks_path, notice: 'Task status updated successfully.' }
      format.js   # This will look for a `toggle_status.js.erb` file
    end
  end

  def toggle_priority
    @task = Task.find(params[:id])
    if @task.low?
      @task.high!
    else
      @task.low!
    end

    respond_to do |format|
      format.html { redirect_to user_tasks_path(current_user), notice: 'Task priority updated successfully.' }
      format.js   # This is for AJAX (if you are using it)
    end
  end




  private

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :priority, :status)
  end
end
