class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
    session[:counter].nil? ? session[:counter] = 1 : session[:counter] += 1
    @products = Product.order(:title)
    @cart = current_cart
  end
end
