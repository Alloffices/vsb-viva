class CreateLocationDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :location_descriptions do |t|
      t.string :description

      t.timestamps
    end
  end
end
