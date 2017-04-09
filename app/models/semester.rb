class Semester < ApplicationRecord
    has_many :student_course_semesterships
    has_many :student_special_course_semesterships
    has_many :courses, :through => :student_course_semesterships
    has_many :special_courses, :through => :student_special_course_semesterships
    has_many :students, :through => :student_course_semesterships
    has_many :students, :through => :student_special_course_semesterships

end
