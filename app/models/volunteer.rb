class Volunteer < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :firstname
  validates_presence_of :password

  has_secure_password
  has_many :volunteer_projects
  has_many :projects, through: :volunteer_projects
  has_many :created_projects, class_name: 'Project'
end
