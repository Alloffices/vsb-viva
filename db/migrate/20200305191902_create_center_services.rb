class CreateCenterServices < ActiveRecord::Migration[6.0]
  def change
    create_table :center_services do |t|
      t.references :center, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
