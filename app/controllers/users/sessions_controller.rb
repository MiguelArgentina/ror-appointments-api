class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { message: 'You are logged in. Your token will be valid for one hour after las use. After that you need to sign in again to get a new one.' }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are succesfully logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "We weren´t able to log you out. Make sure you added the token in the authorization header and that the token is valid."}, status: :unauthorized
  end
end
