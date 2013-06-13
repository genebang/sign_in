class UsersController < ApplicationController

  before_filter :check_signin

  def index
  end

  private

  def check_signin
    unless current_user
      redirect_to signin_path, notice: "Not signed in."
    end
  end

end