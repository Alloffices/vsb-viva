class CreateCenterInsurances < ActiveRecord::Migration[6.0]
  def change
    create_table :center_insurances do |t|
      t.references :insurance
      t.references :center

      t.timestamps
    end
  end
end
