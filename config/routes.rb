Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/contractors', to: 'contractors#index'
  get '/contractors/new', to: 'contractors#new'
end
