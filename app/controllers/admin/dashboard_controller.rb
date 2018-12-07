class Admin::DashboardController < ApplicationController
  before_action :authorize
  
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASS']
  

  def show
  end
end
