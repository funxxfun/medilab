Rails.application.routes.draw do
  resources :patients
  resources :medications
  resources :prescriptions

  # アプリケーションのルートパスを患者一覧に設定
  root 'patients#index'
end