class SessionsController < ApplicationController

  def new
  end

  def create
    # raise env["omniauth.auth"].to_yaml
    user = User.from_omniauth(env['omniauth.auth'])
    # if user exists and is saved, create session
    if !user.nil? && user.persisted?
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in!"
    # else
    #   redirect_to, notice: "Unable to sign in."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end

  def failure
    redirect_to signin_url, alert: "Sign in failed. Please try again."
  end

end