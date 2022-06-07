class Animal < ApplicationRecord
    has_many :sightings, dependent: :destroy
    validates :name, presence: true
end
