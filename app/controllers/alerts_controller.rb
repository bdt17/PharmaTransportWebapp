class AlertsController < ApplicationController
  before_action :authenticate_user!
  
  def send_sms
    truck = current_user.trucks.find(params[:id])
    # Twilio SMS (add env vars later)
    redirect_to trucks_path, notice: "🚨 SMS Alert: #{truck.name} POWER FAILURE!"
  end
end
