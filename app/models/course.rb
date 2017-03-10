class Course < ApplicationRecord
    has_many :student_course_semesterships
    has_many :students, :through => :student_course_semesterships
    has_many :semesters, :through => :student_course_semesterships
end
