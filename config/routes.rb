Rails.application.routes.draw do
  get '/', to: redirect('admin/authors')
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
