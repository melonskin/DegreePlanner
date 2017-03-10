class Student < ApplicationRecord
    has_many :student_course_semesterships
    has_many :courses, :through => :student_course_semesterships
    has_many :semesters, :through => :student_course_semesterships
    belongs_to :program
end
