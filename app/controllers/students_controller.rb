class StudentsController < ApplicationController
  before_action :set_student, :only => [:show,:edit,:update,:destroy,:newrequirecourse, :createrequirecourse, :plan, :destroyscs, :addplancourse]
 # autocomplete :course, :name, :display_value => :display_autocomplete, :extra_data => [:department,:number,:name], :full => true



  autocomplete :course, :name, :display_value => :display_autocomplete, :extra_data => [:department,:number,:name], :full => true

  def get_autocomplete_items(params)   
   items = Course.search_by_name(params[:term]).all
  end

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
    student_params_all = student_params
    student_params_all[:user_id] = current_user[:id]
    @student = Student.create!(student_params_all)
    flash[:notice] = "#{@student.firstname}'s profile was successfully created."
    redirect_to student_path(@student)
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

  def newrequirecourse

  end

  def createrequirecourse
    # debugger
    # validate requirecourse
    @student.program.packages.all.each do |package|
      if not createpackage_params[:courses].has_value?(package.id.to_s)
        flash[:warning] = "Pick required courses from each package"
        redirect_to newrequirecourse_student_path
        return
      end
    end
    package_dict = {}
    createpackage_params[:courses].each do |course_id, package_id|
      if not package_dict.has_key?(package_id)
        package_dict[package_id] = 1
      else
        package_dict[package_id] =+ 1
      end
    end
    package_dict.each do |package_id,no_picked|
      if Package.find(package_id).no_required < no_picked
        flash[:warning] = "Pick required number of courses from each package"
        redirect_to newrequirecourse_student_path
        return
      end
    end
    # destroy all relationship
    StudentCourseSemestership.where(:student=>@student).destroy_all
    # create relationship
    createpackage_params[:courses].each do |course_id, package_id|
      term = createpackage_params[:semester][course_id.to_s]
      year = createpackage_params[:year][course_id.to_s]
      semester = Semester.find_by_term_and_year(term, year)
      course = Course.find(course_id)
      # add relationships
      StudentCourseSemestership.create(:student=>@student, :course=>course, :semester=>semester)
      # debugger
    end
      # debugger
    redirect_to plan_student_path
  end

  def plan 
    @semesters = @student.semesters.distinct
    # create relationship
  end

  def addplancourse
    # create relationship
    course = Course.find(params[:course_id])
    term = params[:semester]
    year = params[:year]
    semester = Semester.find_by_term_and_year(term, year)
    StudentCourseSemestership.create(:student=>@student, :course=>course, :semester=>semester)
    redirect_to plan_student_path
  end

  def destroyscs
    course = Course.find(params[:course])
    StudentCourseSemestership.where(:student => @student, :course=>course).destroy_all
    flash[:notice] = "#{course.name} was deleted."
    redirect_to plan_student_path
  end

  private

  def student_params
    student_params = params.require(:student).permit(:firstname, :lastname, :is_f1, :program_id)
    student_params[:program_id] = Program.find_by_name(student_params[:program_id]).id
    student_params
  end

  def createpackage_params
    createpackage_params = params
  end

  def set_student
    @student = Student.find(params[:id])
  end

end
