class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :acct_name
      t.boolean :has_money
      t.integer :dollar_amount

      t.timestamps
    end
  end
end
