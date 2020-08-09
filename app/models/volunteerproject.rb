class VolunteerProject < ActiveRecord::Base
  belongs_to :projects
  belongs_to :volunteers
end
