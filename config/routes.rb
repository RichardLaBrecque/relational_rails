Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/neighborhoods', to:'neighborhoods#index'
  get '/houses', to:'houses#index'
  get '/neighborhoods/:id', to:'neighborhoods#show'
  get '/houses/:id', to:'houses#show'

  get '/contractors', to: 'contractors#index'
  get '/clients', to: 'clients#index'
  get '/clients/:id', to: 'clients#show'
  get '/contractors/:id', to: 'contractors#show'
end
