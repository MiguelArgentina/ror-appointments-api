class ProvidersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { message: "If you see this, you're in!" }
  end
end