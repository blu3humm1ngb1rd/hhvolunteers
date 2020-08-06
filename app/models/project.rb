class Project < ActiveRecord::Base
  belongs_to :volunteer
  has_many :volunteers
end
