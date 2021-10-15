Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome page
  get '/', to: 'welcome#index'

  #customers
  get '/customers', to: 'customers#index'
  get '/customers/:id', to: 'customers#show'

  #accounts
  get '/accounts', to: 'accounts#index'
end
