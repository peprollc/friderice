class HomeController < ApplicationController
  include GoogleUrlHelper

  def index
    @shops = Shop.includes(:favorite_users, :unfavorite_users).all
  end

  def about
  end
end