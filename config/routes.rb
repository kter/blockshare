Rails.application.routes.draw do
  root 'home#top' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'session#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'session#destroy', as: 'signout'
end
