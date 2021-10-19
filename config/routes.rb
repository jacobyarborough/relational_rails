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
  
  #channel_subscribers
  get "/channels/:channel_id/subscribers", to: 'channel_subscribers#index'
  
  #customers
  get '/customers', to: 'customers#index'
  get '/customers/:id', to: 'customers#show'

  #accounts
  get '/accounts', to: 'accounts#index'
  get '/accounts/:id', to: 'accounts#show'

  #customer accounts
  get '/customers/:id/accounts', to: 'customer_accounts#index'
end
