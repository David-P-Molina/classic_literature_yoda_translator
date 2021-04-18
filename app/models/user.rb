class User < ApplicationRecord
  has_many :classics
  has_many :authors
  validates :username, uniqueness: true, length: {in: 8..20}
  validates :email, presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
  has_secure_password
  validates :password, length:{in: 8..30}, confirmation: true, on: :create
end
