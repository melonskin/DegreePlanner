class StudentSpecialCourseSemestership < ApplicationRecord
    belongs_to :student
    belongs_to :special_course
    belongs_to :semester
    
    before_save
<<<<<<< HEAD
    validates :special_course, uniqueness: { scope: :semester, message: "should happen once per semester" }
    validates :credit, presence:true
=======
    # validates :special_course, uniqueness:{ scope: :semester, message: "should happen once per semester" }
>>>>>>> d3c31c500827cb2f2b84b7cc1a765ad9534cd6e6
end
