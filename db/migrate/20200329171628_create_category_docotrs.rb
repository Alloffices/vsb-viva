class CreateCategoryDocotrs < ActiveRecord::Migration[6.0]
  def change
    create_table :category_docotrs do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :doctor_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
