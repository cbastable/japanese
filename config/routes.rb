Japanese::Application.routes.draw do
  
  devise_for :users
  resources :kanjis, only: [:show]
  resources :words, :only => [:index]
  resources :static_pages
  resources :collections do
    member do
      get :random
    end
    resources :kanjis
  end


  root to: 'static_pages#home'
  #match "/:kanji", to: "kanjis#show", as: :kanji_character ==> messes with static pages. Bad. Fix.
  
  match "/comingsoon", to: "static_pages#comingsoon", as: :comingsoon, via: [:get]
  match "/thanksto", to: "static_pages#thanksto", as: :thanksto, via: [:get]
  match "/collections/:collection", to: "collections#show", as: :collection_set, via: [:get]
  match "/collections/:collection/:kanji", to: "kanjis#show", as: :kanji_in_set, via: [:get]
  match "/test/:collection/kanji/:kanji", to: "collections#test", as: :collection_test, via: [:get]
  match "/test/:collection/words/:word", to: "words#test", as: :word_test, via: [:get]
  match "/words/:collection", to: "collections#words", as: :word_set, via: [:get]
  match "/words/:collection/:word", to: "words#show", as: :word_in_set, via: [:get]
  match "random/words/:collection/", to: "words#random", as: :random_word, via: [:get]

  #match '/library', to: 'users#show'
  #match '/:id',       to: 'stories#show'
  #match '/:id/edit',  to: 'stories#edit'
  #match '/:username' => 'users#show'
end
