class CreateCenterEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :center_events do |t|
      t.references :center, null: false, foreign_key: true
      t.string :title
      t.integer :approved ,default:0
      t.date :start_date
      t.date :end_date
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
