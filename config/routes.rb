Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html`
  root to: 'cocktails#index'

  resources :cocktails, only: [:index, :show, :create, :new] do
    resources :doses, only: [:new, :create, :edit]
  end
  resources :doses, only: :destroy
  get 'cocktails/:id/doses/:dose_id', to: 'doses#edit', as: :new_or_edit_dose
end
