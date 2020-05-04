# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ShippingOrder.destroy_all
ProductionOrder.destroy_all

Connection.destroy_all
Blueprint.destroy_all

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


# Blueprints

Robot.all.each do |robot|
    blueprint_count = rand(3...5)
    product_types = ProductType.all.sample(blueprint_count)

    product_types.each do |type|
        deduction = rand(0...2)
        Blueprint.create(effective_production_time: type.base_production_time - deduction, robot: robot, product_type: type)
    end
end


# Connections

Robot.all.to_a.combination(2).to_a.sample(200).each do |pair|

    Connection.create(robot: pair[0], connected_robot: pair[1])
    Connection.create(robot: pair[1] , connected_robot: pair[0])

end



## Runtime objects:

# Day / DailyRecord

(1...40).each do |num|

    day = Day.create(count: num)

    Robot.all.each do |robot|
        DailyRecord.create(total_satisfaction: rand(5...45), activity: ["idle", "production", "shipping"].sample, robot: robot, day: day)
    end

end


# ProductItem

Robot.all.each do |robot|

    item_count = rand(2...6)
    types = ProductType.all.sample(item_count)

    types.each do |product_type|

        ProductItem.create(current_durability: rand(1...8), owner: robot, type: product_type)
    
    end

end



# ShippingOrders and ProductionOrders

Robot.all.each do |robot|


    prod_order_count = [rand(1...3), robot.blueprints.length].min

    production_blueprints = robot.blueprints.sample(prod_order_count)

    production_blueprints.each do |blueprint|

        previous_order = ProductionOrder.create(blueprint: blueprint, remaining_production_time: rand(1...blueprint.effective_production_time))

        chain_length = rand(0...5)

        previous_connection = robot.connections.sample

        chain_length.times do

            previous_order = ShippingOrder.create(connection: previous_connection, dependency: previous_order)

            previous_connection = previous_connection.connected_robot.connections.sample

        end


    end


end





