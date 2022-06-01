class Admin::DashboardController < ApplicationController
  name =  ENV["username"] 
  pw = ENV["password"]

  http_basic_authenticate_with name: name, password: pw
  
  def show
  end
end
