class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :name
      t.integer :cost
      t.boolean :spanish

      t.timestamps
    end
  end
end
