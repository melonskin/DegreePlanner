class StudentCourseSemestership < ApplicationRecord
    belongs_to :student
    belongs_to :course
    belongs_to :semester
    
    before_save
    validates :semester_id, :numericality => {:greater_than_or_equal_to => :start_id, :less_than_or_equal_to => :end_id, message: "should be within the range."}
    validates :course, uniqueness: true

  
    def start_id
      return Semester.find_by_term_and_year(student.semstart, student.yearstart).id
    end
      
    def end_id
      id = Semester.find_by_term_and_year(student.semend, student.yearend).id
      return id
    end  
end
