class AddColumnCreatedByToCenterEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :center_events, :created_by_id, :integer
  end
end
