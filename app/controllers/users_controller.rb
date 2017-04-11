class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :correct_user, only: [:show]
  
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
      flash[:success] = "Howdy, welcome " + @user.name + "  to the Degree Planner!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
  
    
end
