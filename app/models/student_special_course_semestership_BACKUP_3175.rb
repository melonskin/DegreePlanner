class StudentSpecialCourseSemestership < ApplicationRecord
    belongs_to :student
    belongs_to :special_course
    belongs_to :semester
    
    before_save
<<<<<<< HEAD
    # validates :special_course, uniqueness:{ scope: :semester, message: "should happen once per semester" }
=======
    validates :special_course, uniqueness: { scope: :semester, message: "should happen once per semester" }
    validates :credit, presence:true

>>>>>>> bae680bc7819f803f99b21099bec0739f15a0e9a
end
