Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
            #controller#page
  root to: 'katas#index'

  get 'kata/:id' => 'katas#show', as: :kata
end
