Rails.application.routes.draw do
  #get 'users/new'

  #get 'users/create'
  get 'mypage', to: 'users#me'
  #get 'users/me' # 

  #get 'home/index'

  #get 'sessions/create' #ログイン したら セッションクリエイトを行う
  post 'login', to: 'sessions#create' 

  # get 'sessions/destroy' # ログアウト したら セッションですとろいを行う
  delete 'logout', to: 'sessions#destroy'
  #get 'comments/create'

  #get 'comments/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'boards#index'
  # get 'boards',to: 'boards#index'
  #get 'boards/new', to: 'boards#new'
  #post 'boards', to: 'boards#create'
  #get 'boards/:id', to: 'boards#show'
  #resources :boards
  root 'home#index' #仮index
  resources :users, only: %i[new create]
  resources :boards
  resources :comments, only: %i[create destroy]
end
