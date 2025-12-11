class Api::MonitoringsController < ApplicationController
  def create
    @monitoring = Monitoring.new(monitoring_params)
    @monitoring.truck = current_user.trucks.find(params[:truck_id])
    if @monitoring.save
      ActionCable.server.broadcast "truck_#{@monitoring.truck_id}", @monitoring.as_json
      render json: @monitoring, status: :created
    end
  end
  
  private
  def monitoring_params
    params.require(:monitoring).permit(:voltage, :current, :temp, :status)
  end
end
