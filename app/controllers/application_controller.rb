class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "----- this code runs at the beginning of the request"
    # find logged-in user
  end
end
