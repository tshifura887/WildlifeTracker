class AddRegionToSightings < ActiveRecord::Migration[6.1]
  def change
    add_reference :sightings, :region, null: false, foreign_key: true
  end
end
