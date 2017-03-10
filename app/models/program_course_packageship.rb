class ProgramCoursePackageship < ApplicationRecord
    belongs_to :program
    belongs_to :course
    belongs_to :package
end
