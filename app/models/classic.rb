class Classic < ApplicationRecord
    belongs_to :author
    belongs_to :category
    validates :title, presence: true
    validates :content, length: {minimum: 5}
    
    def category_name=(name)
        self.category = Category.find_or_create_by(name: name)
    end
    def category_name
        self.category ? self.category.name : nil
    end

    def author_name=(name)
        self.author = Author.find_or_create_by(name: name)
    end
    def category_name
        self.author ? self.author.name : nil
end
