class CreateSpecialities < ActiveRecord::Migration[6.0]
  def change
    create_table :specialities do |t|
      t.string :name
      t.string :canonical_url

      t.timestamps
    end
  end
end
