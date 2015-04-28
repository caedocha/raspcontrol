Rails.application.routes.draw do
  root 'raspberries#index'

  resource :raspberries do
    collection do
      get :exec_command
      get :list_all
    end
  end

end
