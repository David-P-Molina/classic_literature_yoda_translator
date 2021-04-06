class Classic < ApplicationRecord
    belongs_to :author
    belongs_to :category
    validates :title, presence: true
    
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
    
end
