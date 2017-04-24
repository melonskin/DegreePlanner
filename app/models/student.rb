class Student < ApplicationRecord
    has_many :student_course_semesterships
    has_many :student_special_course_semesterships
    has_many :courses, :through => :student_course_semesterships
    has_many :special_courses, :through => :student_special_course_semesterships

    has_many :semesters, :through => :student_course_semesterships

    # has_many :semesters, :through => :student_special_course_semesterships

    belongs_to :program
    validates_presence_of :firstname, :lastname, :is_f1, :program_id, :yearstart, :semstart, :yearend, :semend, :user_id

    belongs_to :user
    before_save
    
    validates :firstname, presence: true
    validates :lastname, presence: true

    def seminar_valid
        msg = "Pick enough seminar hours"
        self.special_course_valid(681,self.program.seminar_hour_min,self.program.seminar_hour_max, msg)
    end

    def research_valid
        msg = "Pick enough research hours"
        self.special_course_valid(691,self.program.research_hour_min,self.program.research_hour_max, msg)
    end

    def dstudy_valid
        msg = "Pick enough direct study hours"
        self.special_course_valid(685,self.program.direct_study_hour_min,self.program.direct_study_hour_max, msg)
    end

    def special_all_valid
        seminar_hour = self.seminar_valid()
        research_hour = self.research_valid()
        dstudy_hour = self.dstudy_valid()
        if seminar_hour.nil? or research_hour.nil? or dstudy_hour.nil?
            return nil
        else
            return seminar_hour + research_hour + dstudy_hour
        end

    end

    def special_course_valid(course_number,hour_min,hour_max,msg)
        sc_hour = 0
        self.special_courses.each do |sc|
            if sc.number == course_number
                sc_hour += 1
            end
        end
        if sc_hour == 0
            if hour_min == 0
                return 0
            else
                self.errors.add(:base, msg)
                return nil
            end
        else
            return (sc_hour > hour_max)? hour_max : sc_hour
        end
    end

    def all_valid?
        special_hour = self.special_all_valid()
        if not special_hour.nil?
            return true
        end
    end
end
