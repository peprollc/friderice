class HomeController < ApplicationController
  def index
    ShopSearchForm.new
    @shops = Shop.all
  end

  def about
  end
end