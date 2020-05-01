class Connection < ApplicationRecord
  belongs_to :robot
  belongs_to :connected_robot, class_name: "Robot"
end
