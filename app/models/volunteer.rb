class Volunteer < ActiveRecord::Base
  validates_uniqueness_of :email
  has_secure_password
  has_many :volunteer_projects
  has_many :projects, through: :volunteer_projects
  has_many :created_projects, class_name: 'Project'
end
