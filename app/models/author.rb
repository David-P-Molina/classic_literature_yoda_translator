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

    def birth_is_not_nil
        birth != nil
    end
    def death_is_not_nil
        death != nil
    end
    
    def birth_not_greater_death
        if birth_is_not_nil
            if death != nil && birth > death
            errors.add(:death, "Birth year cannot be greater than Death year.")
            end
        end
    end

    def birth_and_death_not_future_date
        if birth_is_not_nil && birth > Date.today.year 
            errors.add(:birth, "cannot be set in the future!")
        elsif death_is_not_nil && death > Date.today.year
            errors.add(:death, "cannot be set in the future!")
        end
    end
end
