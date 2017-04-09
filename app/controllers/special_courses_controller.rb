class SpecialCoursesController < ApplicationController
  def show
      @course = SpecialCourse.find(params[:id])
  end
end
