Rails.application.routes.draw do
  root 'players#index'

  resource :raspberries do
    collection do
      get :exec_command
      get :list_all
    end
  end

  resource :player do
    collection do
      get :launch
      get :exec_command
    end
  end

end
