Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to:'welcome#index'
  get '/neighborhoods', to:'neighborhoods#index'
  get '/neighborhoods/:id', to:'neighborhoods#show'

  get '/contractors', to: 'contractors#index'
  get '/clients', to: 'clients#index'
  get '/clients/:id', to: 'clients#show'
  get '/contractors/:id', to: 'contractors#show'
end
