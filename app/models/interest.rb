class Interest < ApplicationRecord
    belongs_to :program

    has_many :interest_courseships
    has_many :courses, :through => :interest_courseships
end
