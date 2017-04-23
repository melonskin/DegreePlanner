module StudentsHelper
    # general requirements
    def duration_valid?
        return @semester.last.year - @semester.first.year <= 3
    end 
    
    def maxcredits_valid?
        @semesters.each do |semester|
            credit = 0
            StudentCourseSemestership.where(:student=>@student, :semester=>semester).all.each do |scs|
                course = Course.find(scs.course_id.to_i)
                credit += course.credit
            end
            StudentSpecialCourseSemestership.where(:student=>@student, :semester=>semester).all.each do |sscs|
                credit += sscs.credit
            end
            if credit > 15
                return false
            end
        end
        return true
    end
    
    def f1_valid?
        @semesters.each do |semester|
            credit = 0
            StudentCourseSemestership.where(:student=>@student, :semester=>semester).all.each do |scs|
                course = Course.find(scs.course_id.to_i)
                credit += course.credit
            end
            StudentSpecialCourseSemestership.where(:student=>@student, :semester=>semester).all.each do |sscs|
                credit += sscs.credit
            end
            if credit < 9
                return false
            end
        end
        return true
    end
    
    # specific requirments
end
