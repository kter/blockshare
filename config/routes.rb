Rails.application.routes.draw do
  get 'home/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
