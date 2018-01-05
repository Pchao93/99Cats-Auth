class SessionsController < ApplicationController

  before_action :redirect_to_cats_if_logged_in, except: :destroy

  def new


    # fail
    @user = User.new
    fail
    render :new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:username],
      session_params[:password])
    if @user
      @user.reset_session_token
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["Username or password is invalid"]
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token
    end
    logout!
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
