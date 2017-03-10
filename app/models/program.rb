class Program < ApplicationRecord
    has_many :students

    has_many :program_course_packageships
    has_many :courses, :through => :program_course_packageships
    has_many :packages, :through => :program_course_packageships
end
