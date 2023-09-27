require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

###### employees

class Employee < ActiveRecord::Base
  validates :first_name, presence: true

  validates :hourly_rate, numericality: { greater_than_or_equal_to: 40, message: "wages too low" }

  validates :hourly_rate, numericality: { less_than_or_equal_to: 200, message: "wages too high" }

  validates :store_id, presence: true

  validate :first_name_present, :last_name_present
  def first_name_present
    errors.add(:first_name, "missing first name") unless first_name.present?
  end
  def last_name_present
    errors.add(:last_name, "missing last name") unless last_name.present?
  end
end

@store1.employees.create(first_name: "carol_two", last_name: "Alice", hourly_rate: 60)
@store1.employees.create(last_name: "Evil bob", hourly_rate: 60)


@store1.employees.each do |employee|
  puts "id: #{employee.id || 'nil'} " +
       "first_name: #{employee.first_name || 'nil'}, " +
       "last_name: #{employee.last_name || 'nil'}, " +
       "hourly_rate: #{employee.hourly_rate || 'nil'}, " +
       "store_id: #{employee.store_id || 'nil'}, " +
       "\n#{employee.errors.full_messages.length > 0 ? "error: #{employee.errors.full_messages}" : ''}"
end

###### stores

class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3, message: "name too short"}
  validates :annual_revenue, numericality: { greater_than: 0, message: "no revenue" }
  validate :store_has_apparel

  def store_name_length
    errors.add(:name, "length too short") unless name.length >= 3
  end
  def store_profitable
    errors.add(:annual_revenue, "losing money") unless annual_revenue >= 0
  end
  def store_has_apparel
    errors.add(:base, "no apparel") unless mens_apparel || womens_apparel
  end
end


store1 = Store.create(name: "north", annual_revenue: -500, mens_apparel: true, womens_apparel: true)
store2 = Store.create(name: "east", annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
store3 = Store.create(name: "s", annual_revenue: 0, mens_apparel: false, womens_apparel: false)
store4 = Store.create(name: "west", annual_revenue: 1900000, mens_apparel: false, womens_apparel: false)

puts "#{store1.id} #{store1.name}\nerrors: #{store1.errors.full_messages}"
puts "#{store2.id} #{store2.name}\nerrors: #{store2.errors.full_messages}"
puts "#{store3.id} #{store3.name}\nerrors: #{store3.errors.full_messages}"
puts "#{store4.id} #{store4.name}\nerrors: #{store4.errors.full_messages}"

puts "enter a store name"
print "> "
oops_not_parameterized_store_name_from_user = $stdin.gets.chomp
user_store = Store.create(name: oops_not_parameterized_store_name_from_user, annual_revenue: 1900000, mens_apparel: true, womens_apparel: true)