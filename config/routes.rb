Rails.application.routes.draw do
  post "#{RailsSortable.configuration.namespace}/sortable/reorder", to: "sortable#reorder"
end
