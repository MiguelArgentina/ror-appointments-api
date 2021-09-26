Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/providers', to: 'providers#index'

  match '*unmatched', to: 'application#route_not_found', via: :all
end
