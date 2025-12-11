class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @trucks = current_user.trucks
    @monitorings = Monitoring.where(truck_id: @trucks.pluck(:id)).order(created_at: :desc).limit(50)
  end
end
