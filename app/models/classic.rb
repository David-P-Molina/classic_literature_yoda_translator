class Classic < ApplicationRecord
    belongs_to :author
    belongs_to :category
    validates :title, presence: true
    validates :release_date, presence: true
    validate :classic_must_be_older_than_25_years
    
    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
    end
    def category_name
        self.category.try(:name)#self.category ? self.category.name : nil
    end

    def author_name=(name)
        self.author = Author.find_or_create_by(name: name)
    end
    def author_name
        self.author.try(:name) #self.author ? self.author.name : nil
    end
    #Custom Validations
    def classic_must_be_older_than_25_years
        if release_date.present? && release_date > Date.today.year - 25
            errors.add(:release_date, "Literature must be at least 25 years old!")
        end
    end
end
