class AddColumnUnableToDestroyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :unable_to_destroy, :boolean, default: false
  end
end
