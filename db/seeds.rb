# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.destroy_all



category = Category.create(name: 'blah')
category.children.create(name: 'subcategory')

category = Category.create(name: 'Rock')
category.children.create(name: 'slide')

category = Category.create(name: 'Rocky')
category.children.create(name: 'slidey')
category.children.create(name: 'slippy')