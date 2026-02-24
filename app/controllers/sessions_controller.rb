class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      authenticated = false
      # Attempt BCrypt authentication first
      if @user["password"].start_with?("$2a$", "$2b$", "$2y$")
        if BCrypt::Password.new(@user["password"]) == params["password"]
          authenticated = true
        end
      else
        # Legacy password (plaintext or old hash)
        if @user["password"] == params["password"]
          authenticated = true
          # Upgrade password to BCrypt
          @user["password"] = BCrypt::Password.create(params["password"])
          @user.save
          flash["notice"] = "Your password has been upgraded for better security."
        end
      end

      if authenticated
        session["user_id"] = @user["id"]
        flash["notice"] ||= "Welcome." # Use ||= to keep upgrade message if present
        redirect_to "/companies"
      else
        flash["notice"] = "Invalid email or password."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Invalid email or password."
      redirect_to "/login"
    end
  end

  def destroy
    # logout the user
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
