class Classic < ApplicationRecord
    belongs_to :author
    belongs_to :category
    validates :title, presence: true
    validates :content, length: {minimum: 5}
    
end
