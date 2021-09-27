class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActionController::RoutingError, :with => :error_render_method

  


  def route_not_found
    render json: { error: "Please verify the enpoint. It wasn´t found in our service."}, status: :not_found
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

end
