class Package < ApplicationRecord
    belongs_to :program

    has_many :package_courseships
    has_many :courses, :through => :package_courseships
end
