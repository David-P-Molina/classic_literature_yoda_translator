class Author < ApplicationRecord
    has_many :classics
    has_many :categories, through: :classics
    validates :name, uniqueness: true
    validates :bio, presence: true
end
