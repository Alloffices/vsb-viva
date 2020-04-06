class AddRefToCenter < ActiveRecord::Migration[6.0]
  def change
    add_reference :centers, :location_description, foreign_key: true
  end
end
