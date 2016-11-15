# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Category.count == 0
    category = Category.create(name: 'Company')

    category = Category.create(name: 'Product')
    category.children.create(name: 'Conventional')
    category.children.create(name: 'FHA')
    category.children.create(name: 'HELOC')
    category.children.create(name: 'First Time Homebuyer')
    category.children.create(name: 'Homebuyer')
    category.children.create(name: 'Jumbo')
    category.children.create(name: 'Refinance')
    category.children.create(name: 'Reverse')
    category.children.create(name: 'USDA')
    category.children.create(name: 'VA')

    category = Category.create(name: 'Partners')
    category.children.create(name: 'Referrals')
    category.children.create(name: 'Co-Branded')

    category = Category.create(name: 'Recruiting')
    category = Category.create(name: 'Spanish')
    category = Category.create(name: 'Sales Presentations')
end

if User.count == 0
    User.create!(email: "test@test.com", password: "123456", password_confirmation: "123456", admin: true)
end
