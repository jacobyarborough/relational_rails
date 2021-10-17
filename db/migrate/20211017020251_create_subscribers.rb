class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.integer :age
      t.boolean :top_market

      t.timestamps
    end
  end
end
