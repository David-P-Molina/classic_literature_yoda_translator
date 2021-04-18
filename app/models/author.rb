class Author < ApplicationRecord
    has_many :classics
    has_many :categories, through: :classics
    belongs_to :user
    validates :name, presence: true, uniqueness: true
    validates :biography, presence: true
    validate :birth_not_greater_death
    validate :birth_and_death_not_future_date

    def life_time
        self.birth.to_s + " - " + self.death.to_s 
    end
    def birth_not_greater_death
        if birth > death
            errors.add(:death, "Birth year cannot be greater than Death year.")
        end
    end
    def birth_and_death_not_future_date
        if birth > Date.today.year 
            errors.add(:birth, "Birth cannot be set in the future!")
        elsif death > Date.today.year
            errors.add(:death, "Death cannot be set in the future!")
        end
    end
end
