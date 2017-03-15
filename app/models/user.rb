class User < ApplicationRecord
    # attr_accessor :name, :email

    before_save { self.email = email.downcase }

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@tamu.edu+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }  

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    has_one :student
end
