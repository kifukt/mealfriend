class Ingredient < ApplicationRecord
    has_many :intake
    validates :name, presence: true, length: { in: 3..22 }, uniqueness: true
end
