class AddCollllToCenter < ActiveRecord::Migration[6.0]
  def change
    add_column :centers, :zip_code, :string
  end
end
