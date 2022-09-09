namespace :api do
  namespace :v1, defaults: { format: :json } do
    get :status, to: 'api#status'

    resources :links, only: %i[create, update] do 
      post :encode, on: :collection
      post :decode, on: :collection
    end
  end
end
