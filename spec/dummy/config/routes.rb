Rails.application.routes.draw do

  get 'profile/:username' => 'profile#profile', as: 'profile'
  resources :users, only: [:index, :show]

  root to: redirect('/hello') # TODO: change this
  mount Hello::Engine => "/hello"
end
