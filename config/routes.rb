Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome page
  get '/', to: 'welcome#index'

  #channels
  get '/channels', to: 'channels#index'
  get '/channels/:id', to: 'channels#show'

  #subscribers
  get '/subscribers', to: 'subscribers#index'
  get '/subscribers/:id', to: 'subscribers#show'

  #channel_subscribers
  get "/channels/:channel_id/subscribers", to: 'channel_subscribers#index'

  #customers
  get '/customers', to: 'customers#index'
  get '/customers/new', to: 'customers#new'
  post '/customers', to: 'customers#create'
  get '/customers/:id', to: 'customers#show'
  get '/customers/:id/edit', to: 'customers#edit'
  patch '/customers/:id', to: 'customers#update'

  #accounts
  get '/accounts', to: 'accounts#index'
  get '/accounts/:id', to: 'accounts#show'

  #customer accounts
  get '/customers/:id/accounts', to: 'customer_accounts#index'
end
