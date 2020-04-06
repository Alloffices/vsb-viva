class CreateDoctorCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :doctor_categories do |t|
      t.string :name

      t.timestamps
    end
    add_column :doctors, :doctor_category_id, :integer
  end
end
