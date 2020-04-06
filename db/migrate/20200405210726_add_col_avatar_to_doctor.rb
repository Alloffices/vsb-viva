class AddColAvatarToDoctor < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :avatar, :string
  end
end
