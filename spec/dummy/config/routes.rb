Dummy::Application.routes.draw do
  resources :items
  resources :sequenced_items
  get 'multiple_classes', to: 'multiple_classes#index'
end
