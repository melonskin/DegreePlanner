class StudentsController < ApplicationController
  include StudentsHelper
  autocomplete :course, :name, :display_value => :display_autocomplete, :extra_data => [:department,:number,:name, :is_spring, :is_fall, :is_summer], :full => true
  before_action :set_student, :only => [:show,:edit,:update,:destroy,:required_courses, :create_required_courses,:interest_courses, :create_interest_courses, :plan, :destroy_scs_ship, :add_plan_courses, :add_special_courses, :destroy_sscs_ship, :validation, :f1_valid?]
  before_action :logged_in_user, :only => [:show,:edit,:update,:destroy,:required_courses, :create_required_courses,:interest_courses, :create_interest_courses, :plan, :destroy_scs_ship, :add_plan_courses, :add_special_courses, :destroy_sscs_ship, :validation, :f1_valid?]
  before_action :correct_student, :only => [:show,:edit,:update,:destroy,:required_courses, :create_required_courses,:interest_courses, :create_interest_courses, :plan, :destroy_scs_ship, :add_plan_courses, :add_special_courses, :destroy_sscs_ship, :validation, :f1_valid?]

  @@semesters = nil
  @@student_special_course_semestership = nil
  @@student_course_semestership = nil

  # rewrite autocomplete function
  def get_autocomplete_items(params)   
   items = Course.search_by_name(params[:term]).all
  end

  def show
      @courses = @student.courses.all
  end

  def index
      @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    student_params_all = student_params
    student_params_all[:user_id] = current_user[:id]
    @student = Student.new(student_params_all)
    if @student.save
      flash[:success] = "#{@student.firstname}'s profile was successfully created."
      redirect_to student_path(@student)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @student.update_attributes!(student_params)
    flash[:success] = "#{@student.firstname}'s profile was successfully updated."
    redirect_to student_path(@student)
  end

  def destroy
    @student.destroy
    flash[:warning] = "#{@student.firstname}'s profile was deleted."
    redirect_to students_path
  end

  def required_courses
    # store selected 
    packages = @student.program.packages
    @selected_hash = selected_hash(packages)
    @no_create = (createpackage_params.has_key?(:no_create)) ? 1 : 0
  end

  def create_required_courses
    # if the program has packages course
    if createpackage_params[:semester].nil?
      redirect_to plan_student_path
      return
    end
    # validate requirecourse
    @student.program.packages.all.each do |package|
      if createpackage_params[:courses].nil? or (not createpackage_params[:courses].has_value?(package.id.to_s))
        flash[:danger] = "Pick required courses from each package"
        # render "required_courses"
        redirect_to required_courses_student_path(:courses => createpackage_params[:courses], :semester => createpackage_params[:semester], :year =>createpackage_params[:year])
        return
      end
    end
    package_dict = {}
    createpackage_params[:courses].each do |course_id, package_id|
      package_dict[package_id] = (not package_dict.has_key?(package_id)) ? 1 : package_dict[package_id]+1
    end
    # debugger
    package_dict.each do |package_id,no_picked|
      if Package.find(package_id).no_required > no_picked
        flash[:danger] = "Pick required number of courses from each package"
        # render "required_courses"
        redirect_to required_courses_student_path(:courses => createpackage_params[:courses], :semester => createpackage_params[:semester], :year =>createpackage_params[:year])
        return
      end
    end

    # destroy all relationship for required course
    packages = @student.program.packages
    delete_all_package_courses(packages)

    # create relationship
    select_package_courses(createpackage_params)
    # redirect_to plan_student_path
    # TO DO, modifing package course will be directed to plan path
    # debugger
    if createpackage_params[:no_create].to_i == 1
      redirect_to plan_student_path
    else
      redirect_to interest_courses_student_path
    end
  end

  def interest_courses
    # store selected 
    packages = @student.program.interests
    @selected_hash = selected_hash(packages)
  end

  def create_interest_courses
    # if the program has interest course
    if createpackage_params[:courses].nil?
      redirect_to plan_student_path
      return
    end

    # destroy all relationship for required course
    packages = @student.program.interests
    delete_all_package_courses(packages)
    
    # create relationship
    select_package_courses(createpackage_params)
    
    redirect_to plan_student_path
  end
  
  def plan
    ss_id = []
    StudentSpecialCourseSemestership.where(:student_id => params[:id]).each do |s|
      ss_id.push(s[:semester_id])
    end
    s_id = []
    @student.semesters.each do |s| s_id.push(s.id) end
    # semesters_id = special_semesters + semesters_id
    list = ss_id | s_id
    @semesters = Semester.where(:id => list).order('id').distinct
    if @student.all_valid?
      flash.now[:success] = "Your degree plan is valid."
    end
    @@semesters = @semesters
    @student_special_course_semestership = @@student_special_course_semestership
    @student_course_semestership = @@student_course_semestership
  end

  def add_plan_courses
    # create relationship
    course = Course.find(params[:course_id])
    term = params[:semester]
    year = params[:year]
    semester = Semester.find_by_term_and_year(term, year)
    @@student_course_semestership = StudentCourseSemestership.create(:student=>@student, :course=>course, :semester=>semester)
    redirect_to plan_student_path
  end
  
  def add_special_courses
    # create special course relationship
    department = params[:course][0, 4]
    number = params[:course][4, 3].to_i
    course = SpecialCourse.find_by_department_and_number(department, number)
    term = params[:semestersc]
    year = params[:yearsc]
    semester = Semester.find_by_term_and_year(term, year)
    credit = params[:credit]
    @@student_special_course_semestership = StudentSpecialCourseSemestership.create(:student => @student, :special_course => course, :semester => semester, :credit => credit)
    redirect_to plan_student_path  
  end
  
  def destroy_scs_ship
    course = Course.find(params[:course])
    StudentCourseSemestership.where(:student => @student, :course=>course).destroy_all
    flash[:info] = "#{course.full_name} was deleted."
    redirect_to plan_student_path
  end
  
  def destroy_sscs_ship
    department = params[:course][0, 4]
    number = params[:course][4, 3].to_i
    course = SpecialCourse.find(params[:course])
    semester = params[:semester]
    StudentSpecialCourseSemestership.where(:student => @student, :special_course => course, :semester => semester).destroy_all
    flash[:info] = "#{course.full_name} was deleted."
    redirect_to plan_student_path
  end

  private

  def student_params
    student_params = params.require(:student).permit(:firstname, :lastname, :is_f1,:has_prior_master, :yearstart, :semstart, :yearend, :semend, :program_id)
    student_params[:program_id] = Program.find_by_name(student_params[:program_id]).id
    student_params
  end

  def createpackage_params
    createpackage_params = params
    createpackage_params
  end

  def set_student
    begin
      @student = Student.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @student = nil
    end
  end

# can use for both require courses and interest courses
  def selected_hash(packages)
    @selected_hash = {}
    
    if params.has_key?(:courses)
      courses_hash = Rack::Utils.parse_nested_query(params[:courses])
      semester_hash = Rack::Utils.parse_nested_query(params[:semester])
      year_hash = Rack::Utils.parse_nested_query(params[:year])
      courses_hash.each do |course_id, package_id|
        @selected_hash[package_id.to_i]={} if not @selected_hash.has_key?(package_id.to_i)
        @selected_hash[package_id.to_i][course_id.to_i] = {}
        @selected_hash[package_id.to_i][course_id.to_i][:semester]= semester_hash[course_id.to_s]
        @selected_hash[package_id.to_i][course_id.to_i][:year]= year_hash[course_id.to_s]
      end

    else

      packages.all.each do |package|
        package.courses.all.each do |course|
          if not StudentCourseSemestership.where(:student=>@student, :course=>course).blank?
            @selected_hash[package.id]={} if not @selected_hash.has_key?(package.id)
            @selected_hash[package.id][course.id] = {} if not @selected_hash[package.id].has_key?(course.id)
            selected_semester = Semester.find(StudentCourseSemestership.where(:student=>@student, :course=>course).first.semester_id).term
            selected_year = Semester.find(StudentCourseSemestership.where(:student=>@student, :course=>course).first.semester_id).year
            @selected_hash[package.id][course.id][:semester] = selected_semester
            @selected_hash[package.id][course.id][:year] = selected_year
          end
        end
      end
    end
    @selected_hash
  end
  
  def delete_all_package_courses(packages)
    packages.each do |package|
      package.courses.each do |course|
        StudentCourseSemestership.where(:student=>@student, :course => course).destroy_all
      end
    end
  end
  
  def select_package_courses(createpackage_params)
      createpackage_params[:courses].each do |course_id, package_id|
        term = createpackage_params[:semester][course_id.to_s]
        year = createpackage_params[:year][course_id.to_s]
        semester = Semester.find_by_term_and_year(term, year)
        course = Course.find(course_id)
        # add relationships
        StudentCourseSemestership.create(:student=>@student, :course=>course, :semester=>semester)
    end
  end
  

end
