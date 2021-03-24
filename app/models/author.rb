class Author < ApplicationRecord
    validates :name, uniqueness: true
    validates :bio, presence: true
end
