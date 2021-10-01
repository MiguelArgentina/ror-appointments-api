Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  get '/providers_list', to: 'providers#index'

  post '/provider_available_detail', to: 'providers#provider_available_detail'
  post '/every_provider_available', to: 'providers#every_provider_available'
  post '/provider_services_daily', to: 'providers#provider_services_daily'
  post '/providers_hours_monthly', to: 'providers#providers_hours_monthly'

  post '/new_service', to: 'appointments#new_service'

  match '*unmatched', to: 'application#route_not_found', via: :all
end
