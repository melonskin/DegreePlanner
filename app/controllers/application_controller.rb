class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
  end
  
  def correct_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @user = nil
    end
    redirect_to user_path(current_user) unless @user == current_user
  end
  
  def correct_student
    begin
      @user = User.find(Student.find(params[:id]).user_id)
    rescue ActiveRecord::RecordNotFound
      @user = nil
    end
    redirect_to user_path(current_user) unless @user == current_user
  end
end
