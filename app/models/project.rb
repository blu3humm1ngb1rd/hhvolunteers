class Project < ActiveRecord::Base
  has_many :volunteer_projects
  has_many :volunteers, through: :volunteer_projects
  belongs_to :creator, class_name: 'Volunteer', foreign_key: 'volunteer_id'

  validates_presence_of :name
  validates_presence_of :role
  validates_presence_of :date
end
