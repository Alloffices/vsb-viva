class RemoveColCountryFromZipCode < ActiveRecord::Migration[6.0]
  def change

    remove_column :zip_codes, :country, :string
  end
end
