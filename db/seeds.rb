# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DailyRecord.destroy_all
Day.destroy_all

Influence.destroy_all
IntrinsicDesire.destroy_all
ProductItem.destroy_all

ProductType.destroy_all
Robot.destroy_all


# Robot

60.times do
    name = Faker::FunnyName.unique.name
    Robot.create(name: name)
end

# ProductType

40.times do
    name = Faker::Commerce.unique.product_name
    durability = rand(6...10)
    production = durability - rand(1...3)
    ProductType.create(name: name, max_durability: durability, base_production_time: production)
end

# ProductItem

## These objects are created at runtime


# IntrinsicDesire

Robot.all.each do |robot|

    desire_count =  rand(4...6)
    desires = ProductType.all.sample(desire_count)

    desires.each do |desire|
        IntrinsicDesire.create(strength: rand(1...5), robot: robot, product_type: desire)
    end

end

# Influences 

Robot.all.each do |robot|

    others_influenced = rand(5...15)

    

    influenced = Robot.all.filter{|r| r.id != robot.id}.sample(others_influenced)

    influenced.each do |influenced_robot|
        Influence.create(strength: rand(1...5), influencing_robot: robot, influenced_robot: influenced_robot)
    end

end

# Day / DailyRecord

## These objects are created at runtime



