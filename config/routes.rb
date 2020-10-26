Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :spells
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'spells/:id/confirm_delete', to: 'spells#confirm_delete', as: 'confirm_delete_spell'

  get 'books/:id/confirm_delete', to: 'books#confirm_delete', as: 'confirm_delete_book'
  
  get 'spells/:id/add_to_book', to: 'spells#add_to_book', as: 'add_to_book'
  
  post 'spells/:id/add_to_book', to: 'spells#adding_to_book', as: 'adding_to_book'
  
  post 'books/:id/remove_spell', to: 'books#remove_spell', as: 'remove_spell'
    
  get 'books/:id/add_spell_to_book', to: 'books#add_spell_to_book', as: 'add_spell_to_book'
  
  post 'books/:id/adding_spell_to_book', to: 'books#adding_spell_to_book', as: 'adding_spell_to_book'
  
  get 'spells/findall', to: 'spells#findall', as: 'findall'
    
end