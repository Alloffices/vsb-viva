class AddColToDoctor < ActiveRecord::Migration[6.0]
  def change
    add_reference :doctors, :region, foreign_key: true
  end
end
