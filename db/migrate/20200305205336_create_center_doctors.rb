class CreateCenterDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :center_doctors do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
