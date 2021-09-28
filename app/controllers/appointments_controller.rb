class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def new_service
    render json: { message: "new_service action in appointments controller", extra: request.body }
  end

end

