Rails.application.routes.draw do

  resources :questions do
    resources :answers, except: [:show]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  post 'answer_update', to: 'answers#answer_update', as: 'answer_update'

  post 'answersusers', to: 'answersusers#create'
  post 'ranking', to: 'pages#ranking'
  get 'pages/index'


  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
