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
  get '/contractors/new', to: 'contractors#new'
  get "/contractors/:id/clients", to: 'contractor_clients#index'
  post '/contractors', to: 'contractors#create'
  get '/contractors/:id/clients/new', to: 'contractor_clients#new'
  get '/contractors/:id/edit', to: 'contractors#edit'
  post '/contractors/:id/clients', to: 'contractor_clients#create'
  get '/clients/:id/edit', to: 'clients#edit'
  get '/contractors/:id', to: 'contractors#show'
  patch '/contractors/:id', to: 'contractors#update'
  get '/clients/:id', to: 'clients#show'
  patch '/clients/:id', to: 'clients#update'
  delete '/contractors/:id', to: 'contractors#delete'
end
