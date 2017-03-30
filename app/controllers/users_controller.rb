class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # .authenticate(params[:id][:email])
    # debugger
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Howdy, welcome to the Degree Planner!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
  
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end
end
