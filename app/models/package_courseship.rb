class PackageCourseship < ApplicationRecord
    belongs_to :package
    belongs_to :course
end
