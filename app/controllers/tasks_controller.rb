class TasksController < ApplicationController
  def index
    @tasks = Task.where({"user_id" => session["user_id"]})
  end



  def create
    if @current_user
      @task = Task.new
      @task["description"] = params["description"]
      @task["user_id"] = session["user_id"]
      @task.save
      redirect_to "/tasks"
    else
      flash["notice"] = "You must be logged in to create tasks."
      redirect_to "/login"
    end
  end

def show
  @tasks = task.where({ "user_id" => session["user_id"] })
end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end
end
