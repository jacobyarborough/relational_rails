class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :age
      t.boolean :active_account

      t.timestamps
    end
  end
end
