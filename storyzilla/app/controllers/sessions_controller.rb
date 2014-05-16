class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      flash[:notice] = "Sign in successful!"
      redirect_to root_path
    else
      flash[:error] = "Wrong username or password!"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
