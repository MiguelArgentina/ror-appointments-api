Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  get '/providers', to: 'providers#index'

  post '/provider_available_detail', to: 'providers#provider_available_detail'
  post '/every_provider_available', to: 'providers#every_provider_available'
  post '/providers_services_daily', to: 'providers#services_daily'
  post '/providers_hours_monthly', to: 'providers#hours_monthly'

  post '/new_service', to: 'appointments#new_service'

  match '*unmatched', to: 'application#route_not_found', via: :all
end
