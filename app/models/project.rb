class Project < ApplicationRecord
   
  validates :project_name, presence: true
  has_many :sales_conditions

end
