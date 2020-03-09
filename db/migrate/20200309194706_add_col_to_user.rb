class AddColToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :region, foreign_key: true
  end
end
