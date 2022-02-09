Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/neighborhoods', to:'neighborhoods#index'
  get '/houses', to:'houses#index'
  get '/neighborhoods/:id', to:'neighborhoods#show'
  get '/houses/:id', to:'houses#show'
  get '/neighborhoods/:neighborhood_id/houses', to: 'neighborhood_houses#index'

  get '/contractors', to: 'contractors#index'
  get '/clients', to: 'clients#index'
  get '/contractors/new', to: 'contractors#new'
  get '/contractors/:id/clients/new', to: 'contractor_clients#new'
  get "/contractors/:id/clients", to: 'contractor_clients#index'
  post '/contractors', to: 'contractors#create'
  get '/contractors/:id/edit', to: 'contractors#edit'
  get '/clients/:id', to: 'clients#show'
  patch '/contractors/:id', to: 'contractors#update'
  get '/contractors/:id', to: 'contractors#show'
  post 'contractors/:id/clients', to: 'contractor_clients#create'
end
