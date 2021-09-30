class ProvidersController < ApplicationController
  before_action :authenticate_user!

  def index
    providers = User.where(role: :provider).all.map{|provider|  
      {
        'id': provider.id,
        'email': provider.email
      }
    }
    render json: { message: "you reached /providers_list", 'providers': providers }
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
    query_data = params[:query]
    date = query_data[:date]
    providers_available = []
    
    #slots_occupied = User.find(provider_id).time_slots
    providers_appointments = Appointment.where(start_day: date).includes(:time_slots)
    providers_list = providers_appointments.distinct.pluck(:provider_id)
    providers_list.each do |provdr|
      time_slots_booked = []
      prov_id = provdr
      working_hours_ary = User.find(prov_id).working_hours.pluck(:start_hour, :end_hour)[0]
      working_hours = (working_hours_ary[0]..working_hours_ary[1]).to_a
      providers_appointments.where(provider_id: prov_id).each do |app|
       app.time_slots.each do |ts|
        time_slots_booked += ts.hours
       end
      end
      if (working_hours - time_slots_booked).empty?
        providers_available << {"id": prov_id, "available": "not available on #{date}"}
      else
        providers_available << {"id": prov_id, "available": "#{working_hours - time_slots_booked} hs on #{date}"}
      end
      time_slots_booked = []
    end
  
     #(2..5).overlaps?(6..7) ranges overlapping

    render json: { message: "you reached /every_provider_available", "response": providers_available }
    
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