class ApplicationController < ActionController::API
  
  rescue_from ActionController::RoutingError, :with => :error_render_method



  def route_not_found
    render json: { error: "Please verify the enpoint. It wasn´t found in our service."}, status: :not_found
  end

end
