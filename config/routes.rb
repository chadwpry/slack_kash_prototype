Rails.application.routes.draw do
  namespace :slack do
    scope :auth do
      get :callback, to: 'identities#create'
    end

    post :interactive, to: 'interactive#create'

    scope :commands do
      post :kuestion, to: 'commands#kuestion'
    end
  end
end
