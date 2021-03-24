class Classic < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 5}
    
end
