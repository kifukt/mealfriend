class User < ApplicationRecord
    has_many :intakes
    has_many :diaries
    validates :login, presence: true, uniqueness: true, length: { in: 3..22 }
    has_secure_password
    has_secure_token
    validates :password, presence: true, length: { minimum: 6 }
    def invalidate_token
        self.update_columns(token: nil)
    end
end
