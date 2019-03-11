Rails.application.routes.draw do
  devise_for :users

  scope '(:locale)', locale: /de|en/  do
    root to: 'pages#home'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'applicant/:id/success', to: 'pages#success', as: :success
    get 'applicant/:id/choose_other', to: 'pages#choose_other', as: :choose_other
    get 'applicant/:id/wrong_zip_code', to: 'pages#wrong_zip_code', as: :wrong_zip_code
    get 'dashboard/show', to: 'dashboard#show', as: :dashboard

    resources :applicants, only: [:index, :new, :create, :update]

    namespace :first do
      resources :asylums, only: [] do
        member do
          get 'question'
          get 'apply_for_asylum'
          post 'answer'
        end
      end
    end

    namespace :second do
      resources :living_obligations, only: [] do
        member do
          get 'question'
          get 'unsuccessful'
          post 'answer'
        end
      end
    end

    namespace :third do
      resources :refugee_crisis, only: [] do
        member do
          get 'question'
          post 'answer'
        end
      end
    end

    namespace :fourth do
      resources :application_dates, only: [] do
        member do
          get 'question'
          post 'answer'
          get 'unsuccessful_date'
        end
      end
    end

    namespace :fifth do
      resources :residence_status, only: [] do
        member do
          get 'question'
          post 'answer'
          get 'choose_other'
        end
      end
    end

    namespace :sixth do
      resources :occupation_type, only: [] do
        member do
          get 'question'
          post 'answer'
        end
      end
    end

    namespace :seventh do
      resources :university_degree, only: [] do
        member do
          get 'question'
          post 'answer'
        end
      end
    end

    namespace :eighth do
      resources :final_info, only: [] do
        member do
          get 'question'
          post 'answer'
        end
      end
    end

    namespace :nineth do
      resources :results, only: [] do
        member do
          get 'results'
          get 'form_1'
          get 'form_2'
        end
      end
    end

  end
end
