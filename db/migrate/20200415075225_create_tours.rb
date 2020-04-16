class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :your_name
      t.string :email
      t.string :phone
      t.date :date
      t.time :time
      t.string :notes
      t.integer :contacted_via

      t.timestamps
    end
  end
end
