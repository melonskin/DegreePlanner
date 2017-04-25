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
        ss_id = []
        StudentSpecialCourseSemestership.where(:student_id => @student).each do |s|
          ss_id.push(s[:semester_id])
        end
        s_id = []
        @student.semesters.each do |s| s_id.push(s.id) end
        list = ss_id | s_id
        @semesters = Semester.where(:id => list).order('id').distinct        
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
    def csce_valid?
        @csce_course = []
        @csce_credit = 0
        StudentCourseSemestership.where(:student=>@student).all.each do |scs|
            course = Course.find(scs.course_id.to_i)
            if course.department == "CSCE" && course.number.to_s =~ /^6/
                @csce_course.push(scs.course_id)
                @csce_credit += Course.find(scs.course_id.to_i).credit
                if @csce_credit >= 18
                    return true
                end
            end
        end 
        return false
    end
    
    def level400_credit
        credit = 0
        StudentCourseSemestership.where(:student=>@student).all.each do |scs|
            course = Course.find(scs.course_id.to_i)
            if course.number.to_s =~ '/^4' && course.department == "CSCE"
                credit += course.credit
            end
        end
        return[credit, 3].min
    end
    
    def elective_valid?
        @elective_credit = 0
        StudentCourseSemestership.where(:student=>@student).all.each do |scs|
            if !array.include?(scs.course_id)
                course = Course.find(scs.course_id.to_i)
                if course.number.to_s == '/^6'
                    @elective_credit += course.credit
                end
            end
        end
        return @elective_credit > 18
    end
    
    def seminar_valid?
        @seminar_credit = 0
        StudentSpecialCourseSemestership.where(:student=>@student).all.each do |sscs|
            course = SpecialCourse.find(sscs.special_course_id.to_i)
            if course.number == 681
                @seminar_credit = 1
                return true
            end
        end
        return false
    end
    
    def directed_study_credit
        StudentSpecialCourseSemestership.where(:student=>@student).all.each do |sscs|
            course = SpecialCourse.find(sscs.special_course_id.to_i)
            if course.number == 685
                return [sscs.credit, 3].min
            end
        end
        return 0
    end
    
    def total_valid?
        @level400_credit = level400_credit
        @dstudy_credit = directed_study_credit
        return @csce_credit + @elective_credit + @seminar_credit + @level400_credit + @dstudy_credit > 30
    end
    
end
