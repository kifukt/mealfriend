class User < ApplicationRecord
    has_many :intakes
    has_many :diary
    validates :login, presence: true, uniqueness: true, length: { in: 3..22 }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
