class CreateCenterSpecialities < ActiveRecord::Migration[6.0]
  def change
    create_table :center_specialities do |t|
      t.references :center, null: false, foreign_key: true
      t.references :speciality, null: false, foreign_key: true
      t.timestamps
    end
  end
end
