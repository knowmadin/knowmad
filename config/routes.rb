Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users, path: "auth", path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      registration: 'register',
      sign_up: 'cmon_let_me_in'
    }
end
