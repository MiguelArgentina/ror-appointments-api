Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/providers', to: 'providers#index'
  get '/providers_services_daily', to: 'providers#services_daily'
  get '/providers_hours_monthly', to: 'providers#hours_monthly'
  post '/new_service', to: 'appointments#new_service'

  match '*unmatched', to: 'application#route_not_found', via: :all
end
