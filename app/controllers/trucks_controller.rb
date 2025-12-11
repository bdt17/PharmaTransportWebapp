class TrucksController < ApplicationController
  before_action :authenticate_user!
  def index
    @trucks = current_user.trucks
  end
  def new
    @truck = Truck.new
  end
  def create
    @truck = current_user.trucks.new(truck_params)
    if @truck.save
      redirect_to trucks_path
    else
      render :new
    end
  end
  
  private
  def truck_params
    params.require(:truck).permit(:name, :status, :temp, :power_status)
  end
end
