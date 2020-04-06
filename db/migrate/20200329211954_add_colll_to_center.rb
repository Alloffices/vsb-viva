class AddColllToCenter < ActiveRecord::Migration[6.0]
  def change
    add_column :centers, :monday_ext_hours, :time
    add_column :centers, :tuesday_ext_hours, :time
    add_column :centers, :wednesday_ext_hours, :time
    add_column :centers, :thursday_ext_hours, :time
    add_column :centers, :friday_ext_hours, :time
    add_column :centers, :saturday_ext_hours, :time
    add_column :centers, :sunday_ext_hours, :time
  end
end
