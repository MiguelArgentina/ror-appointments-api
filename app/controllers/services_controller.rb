class ServicesController < ApplicationController
  before_action :authenticate_user!

  def list_services

    services_list = []
    begin
      Service.all.each do|srvc|
        services_list << {"id": srvc.id, "name": srvc.name}
      end

    rescue => e
      handle_error_method(e)
    end
    render json: { message: "you reached /list_services", 
                    "response": { "services_list": services_list
                                }
                  }
  end

  def handle_error_method(exception)
    render json: { error: "#{exception.class}: #{exception.message}"}, status: :not_found
  end
end
