class CreateMeetPhysicians < ActiveRecord::Migration[6.0]
  def change
    create_table :meet_physicians do |t|
      t.string :your_name
      t.string :email
      t.string :phone
      t.string :date
      t.string :time
      t.string :notes
      t.integer :contacted_via

      t.timestamps
    end
  end
end
