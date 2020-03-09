class AddCollToCenter < ActiveRecord::Migration[6.0]
  def change
    add_reference :centers, :region, foreign_key: true
    add_reference :centers, :zip_code, foreign_key: true
  end
end
