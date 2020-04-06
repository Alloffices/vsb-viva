class RemoveCollFromDoctor < ActiveRecord::Migration[6.0]
  def change

    remove_column :doctors, :language, :integer
  end
end
