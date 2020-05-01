class ShippingOrder < ApplicationRecord
  belongs_to :connection
  belongs_to :dependency, polymorphic: true
  has_one :dependent_order, class_name: "ShippingOrder", as: :dependency
end
