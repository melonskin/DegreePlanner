class Course < ApplicationRecord
  has_many :student_course_semesterships
  has_many :students, :through => :student_course_semesterships
  has_many :semesters, :through => :student_course_semesterships
  has_many :package_courseships
  has_many :packages, :through => :package_courseships
  has_many :coursesections

  scope :search_by_name, lambda { |q|
    q.downcase!
  (q ? where(["cast(number as text) LIKE ? or lower(name) LIKE ? or (lower(department) || ' ' || cast(number as text)) like ? or (lower(department) || cast(number as text)) like ? ", '%'+ q + '%', '%'+ q + '%','%'+ q + '%', '%'+ q + '%'])  : {})
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

  def full_name
    "#{self.department}"+"#{self.number}"+" "+"#{self.name}"
  end
  
  def no_student
    no_stu = 0
    self.coursesections.each do |section|
      no_stu += section.student 
    end
    no_stu
  end
  
  def average_gpa
    no_stu = 0
    gpa_total = 0
    self.coursesections.each do |section|
      no_stu += section.student 
      gpa_total += section.gpa*section.student
    end
    gpa = gpa_total/no_stu
    gpa.round(2)
  end
  
  def average_a
    no_stu = 0
    a_total = 0
    self.coursesections.each do |section|
      no_stu += section.student 
      a_total += section.a.to_f*section.student
    end
    a = a_total/no_stu
    a.round(2).to_s + "%"
  end
  
  def average_b
    no_stu = 0
    b_total = 0
    self.coursesections.each do |section|
      no_stu += section.student 
      b_total += section.b.to_f*section.student
    end
    b = b_total/no_stu
    b.round(2).to_s + "%"
  end
  
  def popup_display
    if self.no_student != 0
      popup = "GPA: " + self.average_gpa.to_s + "\n" +"A: " + self.average_a + "\n" + "B: " + self.average_b + "\n" + self.offered_semester
    else
      popup = "NULL"
    end
  end
end
