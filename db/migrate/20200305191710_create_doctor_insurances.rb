class CreateDoctorInsurances < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_insurances do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :insurance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
