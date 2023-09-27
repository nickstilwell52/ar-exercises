require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'

puts "Exercise 3"
puts "----------"

# Your code goes here ...

stores = Store.all
puts stores.count
@store3 = stores.find_by(id: 3)
@store3.destroy
puts stores.count