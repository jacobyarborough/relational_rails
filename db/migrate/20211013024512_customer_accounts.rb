class CustomerAccounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :accounts, :customer
    add_foreign_key :accounts, :customers
  end
end
