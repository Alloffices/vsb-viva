class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :your_name
      t.string :email
      t.string :phone
      t.string :date
      t.string :time
      t.string :notes
      t.integer :contacted_via ,default: 0

      t.timestamps
    end
  end
end
