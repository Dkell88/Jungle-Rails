class Admin::DashboardController < ApplicationController
  name =  ENV["username"] 
  pw = ENV["password"]

  http_basic_authenticate_with name: name, password: pw
  
  def show

    @product_count = Product.count
    @category_count = Category.count

  end
end
