class Course < ApplicationRecord
    has_many :student_course_semesterships
    has_many :students, :through => :student_course_semesterships
    has_many :semesters, :through => :student_course_semesterships

    has_many :package_courseships
    has_many :packages, :through => :package_courseships

    has_many :coursesections
end
