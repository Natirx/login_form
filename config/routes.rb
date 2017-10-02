Rails.application.routes.draw do
  
  devise_for :users
  root 'static_pages#home'
  get 'users/remove_photo', to: 'users#remove_photo', as: 'remove_user_photo'
  


end
