class Project < ApplicationRecord
   
  validates :project_name, presence: true, uniqueness: true
  has_many :sales_conditions

end
