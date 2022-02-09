Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/neighborhoods', to:'neighborhoods#index'
  get '/houses', to:'houses#index'
  get '/neighborhoods/new', to:'neighborhoods#new'
  get '/neighborhoods/:id', to:'neighborhoods#show'
  get '/neighborhoods/:id/edit', to:'neighborhoods#edit'
  get '/houses/:id/edit', to:'houses#edit'
  patch '/neighborhoods/:id', to: 'neighborhoods#update'
  patch '/houses/:id', to: 'houses#update'
  get '/houses/:id', to:'houses#show'
  get '/neighborhoods/:neighborhood_id/houses', to: 'neighborhood_houses#index'
  get '/neighborhoods/:neighborhood_id/houses/new', to: 'neighborhood_houses#new'
  post '/neighborhoods', to:'neighborhoods#create'
  post '/neighborhoods/:neighborhood_id/houses', to:'neighborhood_houses#create'
  delete '/neighborhoods/:neighborhood_id', to:'neighborhoods#destroy'

  get '/contractors', to: 'contractors#index'
  get '/clients', to: 'clients#index'
  get '/clients/:id', to: 'clients#show'
  get '/contractors/:id', to: 'contractors#show'
  get "/contractors/:id/clients", to: 'contractor_clients#index'
end
