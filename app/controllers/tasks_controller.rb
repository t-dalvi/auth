class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new
    @task["description"] = params["description"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
