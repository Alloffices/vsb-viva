class RemoveCollFromCenter < ActiveRecord::Migration[6.0]
  def change

    remove_column :centers, :monday_ext_hours, :integer

    remove_column :centers, :tuesday_ext_hours, :integer

    remove_column :centers, :wednesday_ext_hours, :integer

    remove_column :centers, :thursday_ext_hours, :integer

    remove_column :centers, :friday_ext_hours, :integer

    remove_column :centers, :saturday_ext_hours, :integer

    remove_column :centers, :sunday_ext_hours, :integer
  end
end
