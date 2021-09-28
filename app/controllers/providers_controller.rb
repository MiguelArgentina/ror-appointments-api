class ProvidersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: { message: "index action in providers controller" }
  end

  def hours_monthly
    render json: { message: "hours_monthly action in providers controller" }
  end

  def services_daily
    render json: { message: "services_daily action in providers controller" }
  end

  def provider_available_detail
    render json: { message: "provider_available action in providers controller" }
  end

  def every_provider_available
    render json: { message: "provider_available action in providers controller" }
  end
end