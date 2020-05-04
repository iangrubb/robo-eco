class RobotsController < ApplicationController
  def index

    @robots = Robot.all

    # every robot, with current satisfaction, number of shipping orders, number of production orders

    @test = Robot.left_outer_joins(blueprints: :production_orders)

    byebug


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
