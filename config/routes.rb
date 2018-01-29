Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
            #controller#method
  root to: 'katas#index'
  #                                      #kata_path
  # get 'kata/:id' => 'katas#show', as: :kata
  #
  # get 'edit/:id' => 'katas#edit', as: :edit_kata
  #
  # patch 'kata/:id' => 'katas#update'
  #
  # delete 'kata/:id' => 'katas#delete', as: :delete_kata
  #
  # get 'new/kata' => 'katas#new', as: :new_kata
  #
  # post 'create/kata' => 'katas#create', as: :create_kata

  resources :katas
end
