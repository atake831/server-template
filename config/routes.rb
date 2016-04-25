Rails.application.routes.draw do
  constraints subdomain: 'api' do
    namespace :api, path: nil, defaults: {format: :json} do
      resources :boards
    end
  end
end
