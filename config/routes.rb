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
  delete '/channels/:id', to: 'channels#destroy'
  
  #subscribers
  get '/subscribers', to: 'subscribers#index'
  get '/subscribers/:id', to: 'subscribers#show'
  get "/subscribers/:id/edit", to: 'subscribers#edit'
  patch "/subscribers/:id", to: 'subscribers#update'
  delete '/subscribers/:id', to: 'subscribers#destroy'
  
  #channel_subscribers
  get "/channels/:channel_id/subscribers", to: 'channel_subscribers#index'
  get "/channels/:channel_id/subscribers/new", to: 'channel_subscribers#new'
  post "/channels/:channel_id/subscribers", to: 'channel_subscribers#create'
  
  #customers
  get '/customers', to: 'customers#index'
  get '/customers/:id', to: 'customers#show'

  #accounts
  get '/accounts', to: 'accounts#index'
  get '/accounts/:id', to: 'accounts#show'

  #customer accounts
  get '/customers/:id/accounts', to: 'customer_accounts#index'
end
