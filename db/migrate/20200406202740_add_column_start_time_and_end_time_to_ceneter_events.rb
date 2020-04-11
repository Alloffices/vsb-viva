class AddColumnStartTimeAndEndTimeToCeneterEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :center_events, :start_time, :time
    add_column :center_events, :end_time, :time
  end
end
