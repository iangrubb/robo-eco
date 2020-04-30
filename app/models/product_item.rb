class ProductItem < ApplicationRecord
  belongs_to :owner, class_name: "Robot", foreign_key: "robot_id"
  belongs_to :type, class_name: "ProductType", foreign_key: "product_type_id"
end
