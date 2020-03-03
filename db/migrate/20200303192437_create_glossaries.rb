class CreateGlossaries < ActiveRecord::Migration[6.0]
  def change
    create_table :glossaries do |t|
      t.string :key_name
      t.string :spanish
      t.string :english

      t.timestamps
    end
  end
end
