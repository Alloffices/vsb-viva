class AddColumnAdminIdToCenterEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :center_events, :admin_id, :integer
  end
end
