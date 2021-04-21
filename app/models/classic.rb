class Classic < ApplicationRecord
    belongs_to :author
    belongs_to :category
    belongs_to :user
    validates :title, presence: true
    validates :release_date, presence: true
    validate :classic_must_be_older_than_25_years
    #scope methods
    def self.newest_classic
        Classic.order(:release_date).reverse_order.first
    end
    def self.oldest_classic
        Classic.order(:release_date).first
    end
    #Name helpers
    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
    end
    def category_name
        self.category.try(:name)
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
    def author_attributes=(attributes)
        if !attributes["name"].blank? && !attributes["biography"].blank?
            self.author = Author.find_or_create_by(attributes)
        end
    end
end
