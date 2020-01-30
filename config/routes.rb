Rails.application.routes.draw do


  # home_controller
  get '/' => 'home#index'

  # swapfont_controller
  get '/myfont/:random_num' => 'swapfont#show'

  # game_controller
  get 'mypage' => 'games#index'
  get 'play' => 'games#play'
  post 'play' => 'games#play_post'

  # users_controller
  get 'users' => 'users#index'
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
