class CreateDoctorTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_types do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :physician_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
