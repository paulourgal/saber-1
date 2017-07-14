Rails.application.routes.draw do
  get 'school_classes/index'

  devise_for :users

  resources :frequencia, :controller => :attendances, :as => :attendances, :only => [:create]
  get 'frequencia/:school_class_id', :as => :attendances_index, :controller => :attendances, :action => :index
  get 'frequencia/:school_class_id/:id', :as => :attendance, :controller => :attendances, :action => :show

  resources :turmas, :controller => :teachings, :as => :teachings, :only => [:index]

  root :to => 'teachings#index'
end
