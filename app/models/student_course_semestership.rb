class StudentCourseSemestership < ApplicationRecord
    belongs_to :student
    belongs_to :course
    belongs_to :semester
end
