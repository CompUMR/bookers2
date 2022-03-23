Rails.application.routes.draw do
  devise_for :users
  # get 'homes/top'(get 'homes/top' => 'homes#top'の省略形)を消して以下に修正。
  # アプリケーショントップ画面をルートパスに設定。これまで「blogs」などディレクトリ名がトップ画面だったが(例:https://...amazonaws.com/blogs/)、
  # トップ画面を「/」(例:https://...amazonaws.com/)で表示できるようにする。
  # 「/」はルートディレクトリという。ルートディレクトリへのルーティング設定はroot to:で設定する。
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]

  # booksコントローラのupdate、destroyアクションのURLを名前付きルートで設定。
  patch 'books/:id' => 'books#update', as: 'update_book'    # resources :booksで纏めたせいで、名前付きルートupdate_bookが消えててエラーが起きた
  delete 'books/:id' => 'books#destroy', as: 'destroy_book' # resources :booksで纏めたせいで、名前付きルートdestroy_bookが消えててエラーが起きた

  # usersコントローラのupdateアクションのURLを名前付きルートで設定。
  patch 'users/:id' => 'users#update', as: 'update_user'    # resources :usersで纏めたせいで、名前付きルートupdate_userが消えててエラーが起きた

end
