class RobotsController < ApplicationController
  def index

    @production_order_count = Robot.joins(blueprints: :production_orders).group(:id).count

    @shipping_order_count = Robot.joins(connections: :shipping_orders).group(:id).count

    current_day = Day.find_by(count: Day.maximum("count"))

    @robots = 
      Robot.joins(daily_records: :day)
      .select("robots.*", "daily_records.total_satisfaction")
      .where(daily_records: { day: current_day})

  end

  def show

    @robot = Robot.find(params[:id])


    # A robot, with:
      # Current satsifaction
      # All desires, marked by effective vs intrinsic
      # List of owned items
        # Each has contribution to overall satisfaction
      # List of incoming items
      # Current orders, marked by production vs shipping
        # Item involved in the order, robo item eventually goes to
      # Blueprints
      # Daily record data
      # Connections, Influenced, and Infuences
        # Each with current satisfaction, number of shipping orders, number of production orders
      
  end
end
