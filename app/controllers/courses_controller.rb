class CoursesController < ApplicationController
  def show
    @course = Course.find(params[:id])
    @sections = @course.coursesections.all
  end
end
