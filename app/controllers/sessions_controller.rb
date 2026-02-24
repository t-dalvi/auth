class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    # 2. if the user exists -> check if they know their password
    # 3. if they know their password -> login is successful
    # 4. if the user doesn't exist or they don't know their password -> login fails
    flash["notice"] = "Welcome."
    redirect_to "/companies"
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
