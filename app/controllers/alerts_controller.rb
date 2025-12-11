class AlertsController < ApplicationController
  before_action :authenticate_user!
  
  def send_sms
    truck = current_user.trucks.find(params[:truck_id])
    client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
    
    client.messages.create(
      from: ENV['TWILIO_PHONE'],
      to: current_user.phone,
      body: "🚨 POWER FAILURE: #{truck.name} - Voltage: #{truck.monitorings.last.voltage}V"
    )
    
    redirect_to dashboard_path, notice: "SMS alert sent!"
  end
end
