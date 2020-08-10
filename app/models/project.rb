class Project < ActiveRecord::Base
  has_many :projects
  has_many :volunteers, through: :volunteer_projects
end
