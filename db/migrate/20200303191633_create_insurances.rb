class CreateInsurances < ActiveRecord::Migration[6.0]
  def change
    create_table :insurances do |t|
      t.string :state
      t.string :insurance_name

      t.timestamps
    end
  end
end
