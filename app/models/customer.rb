class Customer < ApplicationRecord
  validates :customer_name, presence: true, uniqueness: true

  has_many :projects
end
