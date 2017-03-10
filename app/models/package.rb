class Package < ApplicationRecord
    has_many :program_course_packageships
    has_many :programs, :through => :program_course_packageships
    has_many :courses, :through => :program_course_packageships
end
