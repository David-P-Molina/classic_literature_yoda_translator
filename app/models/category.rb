class Category < ApplicationRecord
    has_many :classics
    has_many :authors, through: :classics
end
