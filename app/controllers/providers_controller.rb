class ProvidersController < ApplicationController

  before_action :authenticate_user!

   

  def index
    begin
      providers = User.where(role: :provider).all.map{|provider|  
        {
          'id': provider.id,
          'email': provider.email
        }
      }
      render json: { message: "you reached /providers_list", 'providers': providers }
    rescue => e
      handle_error_method(e)
    end
  end

  
  def provider_available_detail 
    query_data = params[:query]
    provider_id = query_data[:provider_id]
    date = query_data[:date]
    hour = query_data[:hour]
    
    #slots_occupied = User.find(provider_id).time_slots
    begin
      provider_appointments = Appointment.where(provider_id: provider_id).includes(:time_slots).where(time_slots: { day_booked: date })
      flag = false
      provider_appointments.each do |apptmnt|
        apptmnt.time_slots.all.each do |tslot|
          flag ||= tslot.hours.include?(hour.to_i)
        end
      end
    
      #(2..5).overlaps?(6..7) ranges overlapping

      render json: { message: "you reached /provider_available_detail", "response": { "availability": "#{flag ? "Not available. Provider booked" : "Available. Provider free"} on #{date} at #{hour} hs" } }
    rescue => e
      handle_error_method(e)
    end
  end
  
  def every_provider_available
    query_data = params[:query]
    date = query_data[:date]
    providers_available = []
    begin
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

      render json: { message: "you reached /every_provider_available", "response": providers_available }
    rescue => e
      handle_error_method(e)
    end
  end
  
  def provider_services_daily
    query_data = params[:query]
    provider_id = query_data[:provider_id]
    year = query_data[:year]
    month = query_data[:month]
    report_hash = []
    begin
      
      provider_appointments = Appointment.where(provider_id: 6).where("(EXTRACT(YEAR FROM start_day))::integer = ?", 2021).where("(EXTRACT(MONTH FROM start_day))::integer = ?", 2).order("start_day DESC").includes(:time_slots).includes(:service)


      provider_appointments.each do |apptmnt|
        apptmnt.time_slots.each do |tslot|
          report_hash << {"date": tslot.day_booked, "hours": tslot.hours.sort.reverse, "service": apptmnt.service.name}
        end
      end
      
      render json: { message: "you reached /provider_services_daily", 
                    "response": { "provider_id": provider_id,
                                  "accum_hours_report": report_hash
                                }
                    }
    rescue => e
      handle_error_method(e)
    end
  end
  
  def providers_hours_monthly
    query_data = params[:query]
    provider_id = query_data[:provider_id]
    year = query_data[:year]
    month = query_data[:month]
    begin
      provider_appointments = Appointment.where(provider_id: provider_id).where("(EXTRACT(YEAR FROM start_day))::integer = ?", year.to_i).where("(EXTRACT(MONTH FROM start_day))::integer = ?", month.to_i).includes(:time_slots)

      hours_accum = 0
      provider_appointments.each do |apptmnt|
        apptmnt.time_slots.all.each do |tslot|
          hours_accum += tslot.hours.count
        end
      end
      
      render json: { message: "you reached /providers_hours_monthly", "response": { "accum_hours_report": "for month #{month}/#{year} provider id:#{provider_id} has #{hours_accum} booked hours." } }
    rescue => e
      handle_error_method(e)
    end
  end


  def handle_error_method(exception)
    render json: { error: "#{exception.class}: #{exception.message}"}, status: :not_found
  end


end