class Project < ApplicationRecord
   
  validates :project_name, presence: true, uniqueness: true

end
