class Package < ApplicationRecord
    has_many :package_courseships
    belongs_to :programs
    has_many :courses, :through => :package_courseships
end
