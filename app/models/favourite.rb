class Favourite < ApplicationRecord
  belongs_to :user
  validates_presence_of :location, :location_name
end
