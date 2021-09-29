class ProvidersController < ApplicationController
  before_action :authenticate_user!

  def index
    puts '.....'
    puts params
    puts '.....'
    providers = User.where(role: :provider).all.map{|provider|  
      {
        'id': provider.id,
        'name': provider.email
      }
    }
    render json: { message: "index action in providers controller", 'providers': providers }
    
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
