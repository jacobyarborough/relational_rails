Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome page
  get '/', to: 'welcome#index'

  #channels
  get '/channels', to: 'channels#index'
  get '/channels/new', to: 'channels#new'
  get '/channels/:id', to: 'channels#show'
  post '/channels', to: 'channels#create'
  get '/channels/:id/edit', to: 'channels#edit'
  patch '/channels/:id', to: 'channels#update'

  #subscribers
  get '/subscribers', to: 'subscribers#index'
  get '/subscribers/:id', to: 'subscribers#show'
  get "/subscribers/:id/edit", to: 'subscribers#edit'
  patch "/subscribers/:id", to: 'subscribers#update'

  #channel_subscribers
  get "/channels/:channel_id/subscribers", to: 'channel_subscribers#index'
  get "/channels/:channel_id/subscribers/new", to: 'channel_subscribers#new'
  post "/channels/:channel_id/subscribers", to: 'channel_subscribers#create'

  #customers
  get '/customers', to: 'customers#index'
  get '/customers/new', to: 'customers#new'
  post '/customers', to: 'customers#create'
  get '/customers/:id', to: 'customers#show'
  get '/customers/:id/edit', to: 'customers#edit'
  patch '/customers/:id', to: 'customers#update'
  delete '/customers/:id', to: 'customers#destroy'

  #accounts
  get '/accounts', to: 'accounts#index'
  get '/accounts/:id', to: 'accounts#show'
  get '/accounts/:id/edit', to: 'accounts#edit'
  patch '/accounts/:id', to: 'accounts#update'

  #customer accounts
  get '/customers/:id/accounts', to: 'customer_accounts#index'
  get '/customers/:id/accounts/new', to: 'customer_accounts#new'
  post '/customers/:id/accounts', to: 'customer_accounts#create'
end
