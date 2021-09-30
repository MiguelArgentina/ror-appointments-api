class ProvidersController < ApplicationController
  before_action :authenticate_user!

  def index
    
    providers = User.where(role: :provider).all.map{|provider|  
      {
        'id': provider.id,
        'name': provider.email
      }
    }
    render json: { message: "index action in providers controller", 'providers': providers }
    
  end

  
  def provider_available_detail 
    query_data = params[:query]
    provider_id = query_data[:provider_id]
    date = query_data[:date]
    hour = query_data[:hour]
    
    #slots_occupied = User.find(provider_id).time_slots
    provider_appointments = Appointment.where(provider_id: provider_id).includes(:time_slots).where(time_slots: { day_booked: date })
    flag = false
    provider_appointments.each do |apptmnt|
      apptmnt.time_slots.all.each do |tslot|
        flag ||= tslot.hours.include?(hour.to_i)
      end
    end
  

     #(2..5).overlaps?(6..7) ranges overlapping

    render json: { message: "you reached /provider_available_detail", "response": { "availability": "#{flag ? "Not available. Provider booked" : "Available. Provider free"} on #{date} at #{hour} hs" } }
  end
  
  def every_provider_available
    render json: { message: "provider_available action in providers controller" }
  end
  
  def services_daily
    render json: { message: "services_daily action in providers controller" }
  end
  
  def hours_monthly
    render json: { message: "hours_monthly action in providers controller" }
  end
end

#Select a random record in an ActiveRecord collection
# User.where(role: :client).order('RANDOM()').first

# Filter by month in a date
# Appointment.where('extract(month from start_day) = ?', 3)