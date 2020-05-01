class DailyRecord < ApplicationRecord
  belongs_to :robot
  belongs_to :day
end
