class Post < ApplicationRecord
    validates :content, presence: true
    belongs_to :user
    belongs_to :sales_condition
end
