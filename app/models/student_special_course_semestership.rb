class StudentSpecialCourseSemestership < ApplicationRecord
    belongs_to :student
    belongs_to :special_course
    belongs_to :semester

    before_save
    validates :special_course, uniqueness: { scope: [:semester,:student], message: "can be only taken once per semester" }
    validates :semester_id, :numericality => {:greater_than_or_equal_to => :start_id, :less_than_or_equal_to => :end_id, message: Proc.new { |c| "should be within the range (#{c.start_name} - #{c.end_name})."}}
    validates :credit, presence: true, 
        :numericality => {only_integer: true, greater_than_or_equal_to: 1,
        less_than_or_equal_to: 15, message: Proc.new { |c| "for #{c.course_name} should be within 1 to 15 each semester."}, 
        if: Proc.new { |a| a.special_course.number == 685 || a.special_course.number == 691 }}
    validates :credit, presence: true, 
        :numericality => {only_integer: true, equal_to: 1, message: Proc.new { |c| "for #{c.course_name} should be only 1 within each semester."}, 
        unless: Proc.new { |a| a.special_course.number == 685 || a.special_course.number == 691 }}

    
    def start_id
        return Semester.find_by_term_and_year(student.semstart, student.yearstart).id
    end
        
    def end_id
        id = Semester.find_by_term_and_year(student.semend, student.yearend).id
        return id
    end
    
    def course_name
        dept = SpecialCourse.find(special_course_id).department
        num = SpecialCourse.find(special_course_id).number.to_s
        name = SpecialCourse.find(special_course_id).name
        return dept + num + " " + name
    end
    
    def start_name
        sem = Semester.find(start_id)
        return sem.term + sem.year.to_s
    end
    
    def end_name
        sem = Semester.find(end_id)
        return sem.term + sem.year.to_s
    end
end
