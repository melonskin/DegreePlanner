class Student < ApplicationRecord
    has_many :student_course_semesterships
    has_many :courses, :through => :student_course_semesterships
    has_many :semesters, :through => :student_course_semesterships
    belongs_to :program
    validates_presence_of :firstname, :lastname, :is_f1, :program_id, :user_id

    belongs_to :user
end
