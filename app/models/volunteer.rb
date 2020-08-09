class Volunteer < ActiveRecord::Base
  validates_uniqueness_of :email
  has_secure_password
  has_many :projects, through: :volunteerprojects
end
