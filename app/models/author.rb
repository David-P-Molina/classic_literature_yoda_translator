class Author < ApplicationRecord
    has_many :classics
    has_many :categories, through: :classics
    validates :name, uniqueness: true
    validates :biography, presence: true

    def life_time
        self.birth.to_s + " - " + self.death.to_s
    end
end
