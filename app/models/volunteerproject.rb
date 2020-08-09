class VolunteerProject < ActiveRecord::Base
  has_many :projects, through: :volunteers
end
