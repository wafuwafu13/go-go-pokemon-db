Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :pokemons
      resources :users, only: [ :create ] do
        collection do
          post 'sign_in'
          get 'me'
        end
      end
    end
  end
end