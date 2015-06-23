Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, path: 'auth', path_names: {
    sign_in: 'sign_in',
    sign_out: 'sign_out',
    password: 'secret',
    registration: 'account',
  }
end
