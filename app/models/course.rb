class Course < ApplicationRecord
    has_many :student_course_semesterships
    has_many :students, :through => :student_course_semesterships
    has_many :semesters, :through => :student_course_semesterships

    has_many :program_course_packageships
    has_many :programs, :through => :program_course_packageships
    has_many :packages, :through => :program_course_packageships
end
