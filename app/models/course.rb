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

    def offered_semester
      semester = []
      if self.is_fall.downcase == 'true'
        semester.push('Fall')
      end
      if self.is_spring.downcase == 'true'
        semester.push('Spring')
      end
      if self.is_summer.downcase == 'true'
        semester.push('Summer')
      end
      if semester.length > 1
        semester = semester.join(", ")
      else
        semester = semester.pop
      end
      if semester == []
        semester = "Not offered recently"
      end
      semester
    end

    def display_autocomplete
      semester = self.offered_semester
      semester = "("+semester+")"
      "#{self.department}"+" "+"#{self.number}"+" "+"#{self.name}"+" "+"#{semester}"
    end

end
