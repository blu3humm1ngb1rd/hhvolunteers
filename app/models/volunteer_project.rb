class VolunteerProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :volunteer
end
