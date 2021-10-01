Rails.application.routes.draw do 
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  begin
    get '/providers_list', to: 'providers#index'
    get '/list_services', to: 'services#list_services'

    post '/provider_working_hours', to: 'providers#provider_working_hours'
    post '/provider_available_detail', to: 'providers#provider_available_detail'
    post '/every_provider_available', to: 'providers#every_provider_available'
    post '/provider_services_daily', to: 'providers#provider_services_daily'
    post '/providers_hours_monthly', to: 'providers#providers_hours_monthly'

    post '/book_new_service', to: 'appointments#book_new_service'

    match '*unmatched', to: 'application#route_not_found', via: :all

  rescue => e
      handle_error_method(e)
  end

  
end

def handle_error_method(exception)
  render json: { error: "#{exception.class}: #{exception.message}"}, status: :not_found
end
   
