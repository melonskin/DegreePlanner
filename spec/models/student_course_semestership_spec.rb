require 'rails_helper'

RSpec.describe StudentCourseSemestership, type: :model do
    it { is_expected.to respond_to :student_id }
    it { is_expected.to respond_to :course_id }
    it { is_expected.to respond_to :semester_id }
   
end