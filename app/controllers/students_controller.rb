class StudentsController < ApplicationController
    before_action :set_student, :only => [:show,:edit,:update,:destroy]



    def show
        # id = params[:id]
        # @student = Student.find(id)
        @courses = @student.courses.all
    end

    def index
        @students = Student.all
    end

    def new

    end

    def create
        @student = Student.create!(student_params)
        flash[:notice] = "#{@student.firstname}'s profile was successfully created."
        redirect_to students_path
    end

  def edit
    # @student = Student.find params[:id]
  end

  def update
    # @student = Student.find params[:id]
    @student.update_attributes!(student_params)
    flash[:notice] = "#{@student.firstname}'s profile was successfully updated."
    redirect_to student_path(@student)
  end

  def destroy
    # @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = "#{@student.firstname}'s profile was deleted."
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:firstname, :lastname, :email, :password, :is_f1, :program_id)
  end

  def set_student
    @student = Student.find(params[:id])
  end

end
