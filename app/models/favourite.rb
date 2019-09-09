class Favourite < ApplicationRecord
  belongs_to :user
  validates_presence_of :location, :type, :user_id
end
