class AddAndRemoveColumnsForDoctorsAndCenters < ActiveRecord::Migration[6.0]
  def change
    remove_column :centers, :humana, :integer
    remove_column :centers, :pharmacy, :integer
    remove_column :doctors, :headshot_source, :integer
    remove_column :doctors, :headshot_yext, :integer
    add_column :centers, :latitude, :float
    add_column :centers, :longitude, :float
    add_column :centers, :center_admin, :string
    remove_foreign_key :centers, :zip_codes
    drop_table :zip_codes
    drop_table :glossaries
  end
end
