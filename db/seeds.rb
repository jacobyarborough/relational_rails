# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Account.destroy_all

ted = Customer.create!(name: 'Ted', age: 28, active_account: true)
jim = Customer.create!(name: 'Jim', age: 29, active_account: false)
bob = Customer.create!(name: 'Bob', age: 33, active_account: true)


ted.accounts.create!(acct_name: 'Google', has_money: true,dollar_amount: 5)
ted.accounts.create!(acct_name: 'Amazon', has_money: false, dollar_amount: 6)


jim.accounts.create!(acct_name: 'Best Buy', has_money: true, dollar_amount: 7)
jim.accounts.create!(acct_name: 'Gamestop', has_money: false, dollar_amount: 8)

bob.accounts.create!(acct_name: 'Turing', has_money: false, dollar_amount: 20)
bob.accounts.create!(acct_name: 'Broncos', has_money: true, dollar_amount: 50)
