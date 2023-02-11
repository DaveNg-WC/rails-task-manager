class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    if @task.completed
      @done_text = "This task is completed"
    else
      @done_text = "This task is not completed yet"
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
