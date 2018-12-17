# frozen_string_literal: true

Rails.application.routes.draw do
  post "/start", to: "probes#start"
  get "/position", to: "probes#position"
  put "/move", to: "probes#move"
end
