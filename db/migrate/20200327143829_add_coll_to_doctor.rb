class AddCollToDoctor < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :language, :string
  end
end
