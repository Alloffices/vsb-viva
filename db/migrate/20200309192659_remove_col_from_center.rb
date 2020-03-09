class RemoveColFromCenter < ActiveRecord::Migration[6.0]
  def change

    remove_column :centers, :zip_code, :integer

    remove_column :centers, :lat, :string

    remove_column :centers, :lng, :string

    remove_column :centers, :state, :string
  end
end
