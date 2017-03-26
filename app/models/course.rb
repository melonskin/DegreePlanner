class Course < ApplicationRecord
    has_many :student_course_semesterships
    has_many :students, :through => :student_course_semesterships
    has_many :semesters, :through => :student_course_semesterships

    has_many :package_courseships
    has_many :packages, :through => :package_courseships

    has_many :coursesections

# works in sqlite, may need some change for pg
    scope :search_by_name, lambda { |q|
      q.downcase!
    (q ? where(["number LIKE ? or lower(name) LIKE ? or (lower(department) || ' ' || number) like ? or (lower(department) || number) like ? ", '%'+ q + '%', '%'+ q + '%','%'+ q + '%', '%'+ q + '%'])  : {})
    }

    def display_autocomplete
      "#{self.department}"+" "+"#{self.number}"+" "+"#{self.name}"
    end

    
end
