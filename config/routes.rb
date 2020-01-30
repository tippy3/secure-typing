Rails.application.routes.draw do

  # home_controller
  get '/' => 'home#index'

  # users_controller
  get 'mypage' => 'users#index'
  get 'settings' => 'users#edit'
  post 'settings' => 'users#edit_post'
  post 'settings/destroy' => 'users#destroy'

  # login, logout, signup
  get 'login' => 'users#login'
  post 'login' => 'users#login_post'
  post 'logout' => 'users#logout_post'
  get 'signup' => 'users#signup'
  post 'signup' => 'users#signup_post'

end
