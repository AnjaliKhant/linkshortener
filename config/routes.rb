Rails.application.routes.draw do
  root 'long_to_short_urls#new'
  get 'long_to_short_urls/:id/info', to: 'long_to_short_urls#info', as: 'long_to_short_url_info'
  resources :long_to_short_urls, only: [:new, :create, :show]
end
