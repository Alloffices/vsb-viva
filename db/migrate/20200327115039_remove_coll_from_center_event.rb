class RemoveCollFromCenterEvent < ActiveRecord::Migration[6.0]
  def change

    remove_column :center_events, :image, :string
  end
end
