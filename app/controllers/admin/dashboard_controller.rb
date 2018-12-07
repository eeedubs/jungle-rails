class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: 'Jungle', password: 'book', except: :not_permitted

  def not_permitted
      render plain: "You do not have access to these features."
  end

  def show
  end
end
