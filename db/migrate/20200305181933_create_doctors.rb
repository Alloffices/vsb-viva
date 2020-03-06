class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :language
      t.string :education
      t.string :certifications
      t.string :biography
      t.string :video_id
      t.string :headshot_yext
      t.string :headshot_source

      t.timestamps
    end
  end
end
