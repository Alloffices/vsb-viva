class CreateCenters < ActiveRecord::Migration[6.0]
  def change
    create_table :centers do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :county
      t.string :primary_phone
      t.string :additional_phones
      t.string :fax
      t.integer :pharmacy
      t.integer :humana
      t.time :monday_hours
      t.time :tuesday_hours
      t.time :wednesday_hours
      t.time :thursday_hours
      t.time :friday_hours
      t.time :saturday_hours
      t.time :sunday_hours
      t.time :special_hours
      t.string :lat
      t.string :lng
      t.string :calendar_notes
      t.string :approved_calendar_notes
      t.integer :monday_ext_hours
      t.integer :tuesday_ext_hours
      t.integer :wednesday_ext_hours
      t.integer :thursday_ext_hours
      t.integer :friday_ext_hours
      t.integer :saturday_ext_hours
      t.integer :sunday_ext_hours

      t.timestamps
    end
  end
end
