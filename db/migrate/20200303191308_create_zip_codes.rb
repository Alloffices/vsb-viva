class CreateZipCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :zip_codes do |t|
      t.integer :zipcode
      t.string :country
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
