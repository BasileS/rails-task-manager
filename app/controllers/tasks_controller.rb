class TasksController < ApplicationController

  def index
   @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])

    if @tasks.completed == true
      @done = "this task is completed"
    else @done = "this task is not completed yet"
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def edit
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
