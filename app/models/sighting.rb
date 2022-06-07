class Sighting < ApplicationRecord
  belongs_to :animal
  belongs_to :region

  validates :date, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
