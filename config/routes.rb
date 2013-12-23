Rails.application.routes.draw do
  post "/sortable/reorder", to: "sortable#reorder"
end
