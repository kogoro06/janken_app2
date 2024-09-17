Rails.application.routes.draw do
  devise_for :users

  get '/start', to: 'janken#start', as: 'start_janken'
  get '/play', to: 'janken#play', as: 'play_janken'
  get '/hoi', to: 'janken#hoi', as: 'hoi_janken'
  get '/ranking', to: 'janken#ranking', as: 'ranking'
  get '/my_score', to: 'janken#my_score', as: 'my_score'
  get "reset", to: "janken#reset", as: :reset
  resource :user, only: [:show, :edit, :update]
  
  root 'janken#start'
end
