class RemoveCollFromTour < ActiveRecord::Migration[6.0]
  def change

    remove_column :tours, :date, :date
    add_column :tours ,:date , :string
  end
end
