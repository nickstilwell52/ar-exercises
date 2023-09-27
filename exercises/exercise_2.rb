require_relative '../setup'
require_relative './exercise_1'

puts "Exercise 2"
puts "----------"

# Your code goes here ...

@store1 = Store.find_by(id: 1)
puts @store1.name

@store2 = Store.find_by(id: 2)
puts @store2.name

@store1.name = 'Burnaby West'
puts @store1.name