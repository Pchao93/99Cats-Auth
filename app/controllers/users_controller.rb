class UsersController < ApplicationController

  before_action :redirect_to_cats_if_logged_in

  def new
    @token = form_authenticity_token
    @user = User.new
    render :new
  end

  def create
    # fail
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = ["username or password is invalid"]
      render :new
    end
  end


  private



  def user_params
    params.require(:user).permit(:username, :password)
    # /users/1
    # params = {id: 1, action: "GET", controller: "UsersController"}
    #
    # def show
    #   @user = User.find_by(id: params[:id])
    #   render :show
    # end
    #
    # /users
    # params = {action: "GET", controller: "UsersController"}
    #
    # def index
    #   @users = User.all
    #   render :index
    # end
    #
    # <form method="POST", action = /users>
    #
    # <input type = text name = user[username]
    #
    # /users?user[username]=joeschmoe&user[password]=sdfkjhsdf #but with a post
    # params = {action: "POST". controller: "UsersController", user: {username: "joeschmoe", password: "sdfsdfsdf"}}
    #
    # params
    #
    # user_params
    #
    # /users/1?user[username]=joeschmoe&user[password]=sdfkjhsdf
    # params = {id: 1, action: "POST". controller: "UsersController", user: {username: "joeschmoe", password: "sdfsdfsdf"}}

  end
end
