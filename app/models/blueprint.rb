class Blueprint < ApplicationRecord
  belongs_to :robot
  belongs_to :product_type

  has_many :production_orders
end
