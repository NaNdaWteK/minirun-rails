Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
            #controller#method
  root to: 'katas#index'
                                       #kata_path
  get 'kata/:id' => 'katas#show', as: :kata

  get 'new/kata' => 'katas#new', as: :new_kata

  post 'create/kata' => 'katas#create', as: :create_kata
end
