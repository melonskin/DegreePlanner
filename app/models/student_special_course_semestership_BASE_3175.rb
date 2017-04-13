class StudentSpecialCourseSemestership < ApplicationRecord
    belongs_to :student
    belongs_to :special_course
    belongs_to :semester
    
    before_save
    validates :special_course, uniqueness: true
    # { scope: :semester, message: "should happen once per semester" }
end
