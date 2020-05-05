class RobotsController < ApplicationController
  def index

    @robots = Robot.all

    # every robot, with current satisfaction, number of shipping orders, number of production orders

    @production_order_count = Robot.joins(blueprints: :production_orders).group(:id).count

    @shipping_order_count = Robot.joins(connections: :shipping_orders).group(:id).count


    @current_day = Day.maximum("count")

    day = Day.find_by(count: @current_day)

    @satisfaction = Robot.joins(daily_records: :day).where(daily_records: { day: day}).pluck(:id, :"daily_records.total_satisfaction")



    # Roll this into the produced @robots array


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
