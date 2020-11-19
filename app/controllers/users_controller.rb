class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    # we will use @user in new.html.erb form
    # this will help setup what get back in params in create
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user # user show path
    else
      render :new
    end

    # another way to do it
    # @user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name])
    # redirect_to @user

    # yet another way to do it
    # @user = User.create(user_params)
    # redirect_to @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
