class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActionController::RoutingError, :with => :error_render_method
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

  private

    def record_not_unique
      render json: { error: "The email you are trying to register already exists on our database. Please contact miguelgomez66@gmail.com", status: 409 }
    end



  def route_not_found
    render json: { error: "Please verify the enpoint. It wasn´t found in our service."}, status: :not_found
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

end
