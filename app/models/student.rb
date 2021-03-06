class Student < ApplicationRecord
    has_many :student_course_semesterships
    has_many :student_special_course_semesterships
    has_many :courses, :through => :student_course_semesterships
    has_many :special_courses, :through => :student_special_course_semesterships

    has_many :semesters, :through => :student_course_semesterships


    belongs_to :program
    validates_presence_of :firstname, :lastname, :is_f1, :has_prior_master, :program_id, :yearstart, :semstart, :yearend, :semend, :user_id

    belongs_to :user
    before_save
    validates :firstname, presence: true
    validates :lastname, presence: true
    
    validates :start_id, :numericality => {:less_than => Proc.new {|c| c.end_id}, :message => "can not be later than Expected Graduation Semester"}

    before_save { |st| st.is_f1 = st.is_f1.capitalize }
    before_save { |st| st.has_prior_master = st.has_prior_master.capitalize }
    
    def total_semester
        ss_id = []
        StudentSpecialCourseSemestership.where(:student_id => self.id).each do |s|
          ss_id.push(s[:semester_id])
        end
        s_id = []
        self.semesters.each do |s| s_id.push(s.id) end
        list = ss_id | s_id
        return Semester.where(:id => list).order('id').distinct
    end
    
    def seminar_valid
        msg = "Seminar"
        return self.special_course_valid(681,self.program.seminar_hour_min,self.program.seminar_hour_max, msg)
    end

    def research_valid
        msg = "Research"
        return self.special_course_valid(691,self.program.research_hour_min,self.program.research_hour_max, msg)
    end

    def dstudy_valid
        msg = "Direct Study"
        return self.special_course_valid(685,self.program.direct_study_hour_min,self.program.direct_study_hour_max, msg)
    end

    def special_all_valid
        seminar_hour,seminar_hour_v = self.seminar_valid()
        research_hour, research_hour_v = self.research_valid()
        dstudy_hour, dstudy_hour_v = self.dstudy_valid()
        if seminar_hour.nil? or research_hour.nil? or dstudy_hour.nil?
            return nil, seminar_hour_v + research_hour_v + dstudy_hour_v
        else
            return true, seminar_hour_v + research_hour_v + dstudy_hour_v
        end
    end

    def special_course_valid(course_number,hour_min,hour_max,msg)
        sc_hour = 0
        StudentSpecialCourseSemestership.where(:student => self).all.each do |sc|
            course = SpecialCourse.find(sc.special_course_id.to_i)
            if course.number == course_number
                sc_hour += sc.credit.to_i
            end
        end
        if (sc_hour >= hour_min)
            return true, [hour_max, sc_hour].min
        else
            if hour_min == hour_max
                msg = "#{msg} hours: #{sc_hour}/#{hour_min}"
            else
                msg = "#{msg} hours: #{sc_hour}/(#{hour_min}-#{hour_max})"
            end
            self.errors.add(:base, msg)
            return nil, sc_hour
        end
    end

    def ug_course_valid
        hour = 0
        self.courses.each do |course|
            if self.program.joint_dep != "NA"
                if course.department == self.program.joint_dep and course.number.to_i/100 == 4
                    hour += course.credit
                end
            elsif (course.department == "CSCE") and (course.number.to_i/100 == 4)
                hour += course.credit
            end
        end
        return [hour,self.program.ug_hour_max].min
    end

    def non_dep_valid
        hour = 0
        self.courses.each do |course|
            if self.program.joint_dep != "NA"
                if course.department != self.program.joint_dep and course.department != "CSCE" and course.number.to_i/100 >= 6 
                    hour += course.credit
                end
            elsif course.department != "CSCE" and course.number.to_i/100 >= 6 
                hour += course.credit
            end
        end
        return true, [hour,self.program.non_dep_hour_max].min 
    end

    def joint_dep_valid
        hour = 0
        if self.program.joint_dep != "NA"
            self.courses.each do |course|
                if course.department == self.program.joint_dep and course.number.to_i/100 >= 6 
                    hour += course.credit
                end
            end
        end
        msg = "#{self.program.joint_dep} courses hours: #{hour}/#{self.program.joint_hour_min}"
        if (hour >= self.program.joint_hour_min)
            return true, [self.program.joint_hour_max, hour].min
        end
        self.errors.add(:base, msg)
        return nil, hour
    end

    def dep_valid
        hour = 0
        self.courses.each do |course|
            if course.department == "CSCE" and course.number.to_i/100 >= 6 
                hour += course.credit
            end
        end
        msg = "CSCE course hours: #{hour}/#{self.program.dep_hour}"
        if (hour >= self.program.dep_hour)
            return true, hour
        end
        self.errors.add(:base, msg)
        return nil, hour
    end

    def elective_valid(dep_hour,joint_hour,non_dep_hour)
        if self.program.elective_hour_min > 0
            hour = [dep_hour.to_i - self.program.dep_hour,0].max + [joint_hour.to_i - self.program.joint_hour_min,0].max + [non_dep_hour.to_i - self.program.non_dep_hour_min,0].max
            if hour < self.program.elective_hour_min
                msg = "Elective course hours: #{hour}/#{self.program.elective_hour_min}"
                self.errors.add(:base,msg)
                return nil
            end
        end
        return true
    end

    def graded_valid(dep_hour,joint_hour,non_dep_hour)
        if self.program.graded_grad_hour> 0
            hour = dep_hour.to_i + joint_hour.to_i + non_dep_hour.to_i
            if hour < self.program.graded_grad_hour
                msg = "Graded course hours: #{hour}/#{self.program.graded_grad_hour}"
                self.errors.add(:base,msg)
                return nil
            end
        end
        return true
    end

    def total_valid(special_hour,ug_hour,dep_hour,joint_hour,non_dep_hour)
        hour = special_hour.to_i + ug_hour.to_i + dep_hour.to_i + joint_hour.to_i + non_dep_hour.to_i
        if self.program.total_hour_prior != 0 and self.has_prior_master.downcase == "true"
            total_hour = self.program.total_hour_prior
        else
            total_hour = self.program.total_hour
        end
        if hour < total_hour
            msg = "Total course hours: #{hour}/#{total_hour}"
            self.errors.add(:base,msg)
            return nil
        end
        return true
    end

    def package_valid
        flag = 0
        if not self.program.packages.first.blank?
            package_dict = {}
            self.courses.each do |course|
                self.program.packages.each do |package|
                    package.courses.each do |c|
                        if c.id == course.id
                            package_dict[package.id] = (not package_dict.has_key?(package.id)) ? 1 : package_dict[package.id]+1
                        end
                    end
                end
            end
            if self.program.packages.count > package_dict.length
                flag = 1
            end
            package_dict.each do |package_id,no_picked|
              if Package.find(package_id).no_required > no_picked
                flag = 1
              end
            end
        end

        if flag == 1
            msg = "Package courses: invalid; go back to edit."
            self.errors.add(:base,msg)
            return nil
        end
        return true
        
    end

    def calculate_credit(semester)
        credit = 0
        StudentCourseSemestership.where(:student=>self, :semester=>semester).all.each do |scs|
            course = Course.find(scs.course_id.to_i)
            credit += course.credit
        end
        StudentSpecialCourseSemestership.where(:student=>self, :semester=>semester).all.each do |sscs|
            credit += sscs.credit
        end
        return credit
    end
    
    def semester_max_valid
        semesters = self.total_semester() 
        flag = 0
        semesters.each do |semester|
            credit = calculate_credit(semester)
            if (credit > 15)
                msg = "#{semester.term} #{semester.year} course hours: #{credit}/(9-15) (exceed limit)"
                self.errors.add(:base,msg)
                flag = 1
            end
        end
        return (flag == 1) ? nil : true
    end
    
    def semester_f1_valid
        if self.is_f1 == "False"
            return true
        end
        semesters = self.total_semester()
        sem_count = semesters.count
        sem_no = 0
        flag = 0
        semesters.each do |semester|
            sem_no += 1
            credit = calculate_credit(semester)
            if credit < 9 
                if sem_no != sem_count and semester.term.downcase != 'summer'
                    msg = "#{semester.term} #{semester.year} course hours: #{credit}/(9-15) (F1 requirement)"
                    self.errors.add(:base,msg)
                    flag = 1
                elsif semester.term.downcase != 'summer'
                    msg = "Reduce course load form required by ISS at the start of #{semester.term} #{semester.year}"
                    self.errors.add(:base,msg)
                end
            end
        end
        return (flag == 1) ? nil : true
    end
    
    def sem_range_valid
        semesters = self.total_semester()
        start_id = self.start_id()
        end_id = self.end_id()
        if !semesters.first.nil? && (start_id > semesters.first.id || end_id < semesters.last.id)
            msg = "You have courses out of your semester range."
            self.errors.add(:base,msg)
            return nil
        end
        return true
    end
        
    def start_id
        return Semester.find_by_term_and_year(self.semstart, self.yearstart).id
    end
        
    def end_id
        return Semester.find_by_term_and_year(self.semend, self.yearend).id
    end
    
    def all_valid?
        sem_range_ok = self.sem_range_valid()
        
        dep_hour,dep_hour_v = self.dep_valid()
        joint_hour,joint_hour_v = self.joint_dep_valid()        
        non_dep_hour,non_dep_hour_v = self.non_dep_valid()
        package_ok = self.package_valid()
        
        special_hour,special_hour_v = self.special_all_valid()
        
        ug_hour = self.ug_course_valid()

        semester_max_ok = self.semester_max_valid()

        elective_ok = self.elective_valid(dep_hour_v,joint_hour_v,non_dep_hour_v)
        graded_ok = self.graded_valid(dep_hour_v,joint_hour_v,non_dep_hour_v)
        total_ok = self.total_valid(special_hour_v,ug_hour,dep_hour_v,joint_hour_v,non_dep_hour_v)

        semester_f1_ok = self.semester_f1_valid()
        
        if not (package_ok.nil? or special_hour.nil? or ug_hour.nil? or 
            non_dep_hour.nil? or joint_hour.nil? or dep_hour.nil? or 
            elective_ok.nil? or graded_ok.nil? or total_ok.nil? or 
            semester_f1_ok.nil? or semester_max_ok.nil? or sem_range_ok.nil?)
            return true
        end
    end
end
