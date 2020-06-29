class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]


  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @registrations = @user.registrations
    @liked_events = @user.liked_events
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'New user created succesfully'
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Account updated succesfully'
    else
      render :edit 
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, alert: "User #{@user.name}, succesfully deleted!"
  end
  
  
  
  private


  def require_correct_user
    @user = User.find(params[:id])
    unless current_user?(@user) 
      redirect_to root_url
    end
  end
  

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
