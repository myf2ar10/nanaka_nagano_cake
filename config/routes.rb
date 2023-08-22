Rails.application.routes.draw do


# 顧客用
# URL /members/sign_in ...
devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # 顧客用
  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    get "members/mypage" => "members#show"
    get "members/information/edit" => "members#edit"
    patch "members/information" => "members#update"
    get "members/confirm_quit" => "members#confirm_quit"
    patch "members/quit" => "members#quit"
    get "search" => "searches#items_search"
    resources :items, only: [:index,:show]
    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete "destroy_all"
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get "confirm"
        get "complete"
      end
    end
    resources :addresses, except: [:show]
  end

  #管理者用
  namespace :admin do
    root to: "homes#top"
    resources :items, except: [:destroy]
    resources :genres, except:  [:show, :destroy]
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      member do
        get "individual"
      end
    end
    resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
