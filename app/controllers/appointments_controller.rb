class AppointmentsController < ApplicationController
  #before_action :authenticate_user!

  def book_new_service
    query_data = params[:query]
    client_id = query_data[:client_id]
    provider_id = query_data[:provider_id]
    service_id = query_data[:service_id]
    start_day = query_data[:start_day]
    end_day = start_day
    start_hour = query_data[:start_hour]
    end_hour = query_data[:end_hour]

    begin
      app = Appointment.new(client_id: client_id, provider_id: provider_id, service_id: service_id, start_day: start_day, end_day: end_day, start_hour: start_hour, end_hour: end_hour)
    if app.save!
      TimeSlot.create(appointment_id: app.id, day_booked: app.start_day, hours: (app.start_hour..app.end_hour-1).to_a)
      render json: { message: "you reached /book_new_service", "status": "service booked succesfully","service_data": "prov_id: #{provider_id}, service: #{service_id}, date:#{start_day}, from #{start_hour} hs to #{end_hour} hs" }, status: :ok
    else
      render json: { message: "you reached /book_new_service", "status": "failed to book service","service_data": "no service data" }, status: 409
    end

    rescue => e
      handle_error_method(e)
    end
  end

  def handle_error_method(exception)
    render json: { error: "#{exception.class}: #{exception.message}"}, status: :not_found
  end
end

