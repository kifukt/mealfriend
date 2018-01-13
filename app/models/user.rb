class User < ApplicationRecord
    has_many :intake
    has_many :diary
end
