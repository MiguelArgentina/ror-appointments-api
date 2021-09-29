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

    puts "..............."
    puts params[:query]
    puts "..............."
    puts 
    query_data = params[:query]
    provider_id = query_data[:provider_id]
    date = query_data[:date]
    hour = query_data[:hour]
    
    #slots_occupied = User.find(provider_id).time_slots
    flag = false
    User.find(Appointment.first.provider_id).time_slots.where(day_booked: date).each do |tslot|
      flag ||= tslot.hours.include?(hour.to_i)
    end
  
    
     #prov.time_slots : all time slots

     #prov.time_slots.first.day_booked == Date.parse('24/08/2021'): compare dates

     #(2..5).overlaps?(6..7) ranges overlapping

    render json: { message: "you reached /provider_available_detail", "response": { "availability": "#{flag ? "Provider not available" : "Provider available"} on #{date} at #{hour} hs" } }
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