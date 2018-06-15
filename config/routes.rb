Rails.application.routes.draw do
  namespace :api do
    resources :trips do
      resources :locations
    end
  end

  scope 'location/:location_id', as: 'location' do
    resources :addresses
  end

  #Do not place any routes below this one
  get '*other', to: 'static#index'
end
