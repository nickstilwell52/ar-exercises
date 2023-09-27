require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
puts Store.count

store = Store.new
store.name = "Surrey"
store.annual_revenue = 224000
store.mens_apparel = false
store.womens_apparel = true
store.save

puts Store.count

Store.create(name: "Whistler", annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)

puts Store.count

store = Store.create(name: "Yaletown", annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

puts Store.count

@mens_stores = Store.where(mens_apparel: true)
@mens_stores.each do |i|
  puts "#{i.name} #{i.annual_revenue}"
end

@womens_stores_small = Store.where(womens_apparel: true).where('annual_revenue < ?', 1000000)
@womens_stores_small.each do |i|
  puts "#{i.name} #{i.annual_revenue}"
end