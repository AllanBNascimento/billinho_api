# frozen_string_literal: true

Rails.application.routes.draw do

  resources :students, :enrollments, :bills, :users
  post "/login", to: "users#login"

end
