class AddAndChangeColumnsToCenter < ActiveRecord::Migration[6.0]
  def up
    add_column :centers, :state, :string
    change_column :centers, :monday_ext_hours, :time
    change_column :centers, :tuesday_ext_hours, :time
    change_column :centers, :wednesday_ext_hours, :time
    change_column :centers, :thursday_ext_hours, :time
    change_column :centers, :friday_ext_hours, :time
    change_column :centers, :saturday_ext_hours, :time
    change_column :centers, :sunday_ext_hours, :time
    remove_column :centers, :zip_code_id, :integer
    remove_column :centers, :region_id, :integer
    remove_column :centers, :user_id, :integer
    add_column :centers, :zip_code, :string
  end

  def down
    remove_column :centers, :state, :string
    change_column :centers, :monday_ext_hours, :integer
    change_column :centers, :tuesday_ext_hours, :integer
    change_column :centers, :wednesday_ext_hours, :integer
    change_column :centers, :thursday_ext_hours, :integer
    change_column :centers, :friday_ext_hours, :integer
    change_column :centers, :saturday_ext_hours, :integer
    change_column :centers, :sunday_ext_hours, :integer
    add_column :centers, :zip_code_id, :integer
    add_column :centers, :region_id, :integer
    add_column :centers, :user_id, :integer
    remove_column :centers, :zip_code, :string
  end
end
