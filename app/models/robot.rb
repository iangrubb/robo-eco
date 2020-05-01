class Robot < ApplicationRecord
    has_many :items, class_name: "ProductItem"

    has_many :intrinsic_desires
    has_many :intrinsically_desired_products, through: :intrinsic_desires, source: :product_type

    has_many :influences_on, class_name: "Influence", foreign_key: "influencing_robot_id"
    has_many :robots_influenced, through: :influences_on, source: :influenced_robot

    has_many :influences_from, class_name: "Influence", foreign_key: "influenced_robot_id"
    has_many :robots_influencing, through: :influences_from, source: :influencing_robot

    has_many :daily_records

    has_many :blueprints
    has_many :producible_products, through: :blueprints, source: :product_type

    has_many :connections
    has_many :connected_robots, through: :connections, source: :connected_robot

end
