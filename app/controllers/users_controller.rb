class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def index
    @users = User.all
  end

  def show
    if logged_in?
      if !flash[:msg]
        flash[:msg] = "Welcome back to the theme park!"
      end
    end
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:msg] = "Welcome to the theme park!"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end

  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :nausau, :happiness, :tickets, :height, :admin)
  end


end
