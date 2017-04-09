class SpecialCourse < ApplicationRecord
    has_many :student_special_course_semesterships
    has_many :students, :through => :student_special_course_semesterships
    has_many :semesters, :through => :student_special_course_semesterships
    
    def full_name
        "#{self.department}"+"#{self.number}"+" "+"#{self.name}"
    end
end
