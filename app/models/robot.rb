class Robot < ApplicationRecord
    has_many :items, class_name: "ProductItem"

    has_many :intrinsic_desires
    has_many :intrinsically_desired_products, through: :intrinsic_desires, source: :product_type

end
