class ProductionOrder < ApplicationRecord
  belongs_to :blueprint

  has_one :dependent_order, class_name: "ShippingOrder", as: :dependency
end
