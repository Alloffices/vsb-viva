class CreateCenterAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :center_administrators do |t|
      t.string :name

      t.timestamps
    end
  end
end
