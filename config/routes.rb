Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/channels', to: 'channels#index'
  get '/channels/:id', to: 'channels#show'
  get '/subscribers', to: 'subscribers#index'
  get 'subscribers/:id', to: 'subscribers#show'
  get "/channels/:channel_id/subscribers", to: 'channel_subscribers#index'
end
