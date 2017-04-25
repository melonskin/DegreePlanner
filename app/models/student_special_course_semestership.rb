class StudentSpecialCourseSemestership < ApplicationRecord
    belongs_to :student
    belongs_to :special_course
    belongs_to :semester

    before_save
    validates :special_course, uniqueness: { scope: :semester, message: "should happen once per semester" }
    validates :semester_id, :numericality => {:greater_than_or_equal_to => :start_id, :less_than_or_equal_to => :end_id, message: "can not exceed your desired period."}
    validates :credit, presence: true, 
        :numericality => {only_integer: true, greater_than_or_equal_to: 1,
        less_than_or_equal_to: 15, message: "should be within 1 to 15."}, 
        if: Proc.new { |a| a.special_course.number == 685 || a.special_course.number == 691 }
    validates :credit, presence: true, 
        :numericality => {only_integer: true, equal_to: 1, message: "should be only 1 within each semester."}, 
        unless: Proc.new { |a| a.special_course.number == 685 || a.special_course.number == 691 }

    
    def start_id
        return Semester.find_by_term_and_year(student.semstart, student.yearstart).id
    end
        
    def end_id
        id = Semester.find_by_term_and_year(student.semend, student.yearend).id
        return id
    end
    
end
