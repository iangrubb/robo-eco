class ProductType < ApplicationRecord
    has_many :items, class_name: "ProductItem"

    has_many :intrinsic_desires
    has_many :intrinsically_desiring_robots, through: :intrinsic_desires, source: :robot

    has_many :blueprints
    has_many :potential_producers, through: :blueprints, source: :robot
    
end
