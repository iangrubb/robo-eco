class Influence < ApplicationRecord
  belongs_to :influencing_robot, class_name: "Robot"
  belongs_to :influenced_robot, class_name: "Robot"
end
