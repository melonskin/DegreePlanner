class Program < ApplicationRecord
    has_many :students
    has_many :packages
    has_many :interests
end
