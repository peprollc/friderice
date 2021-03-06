class UnfavoritesController < ApplicationController

  before_action :request_sign_in
  before_action :set_shop

  def create
    @shop.unfavorites.build(user_id: current_user.id)
    if @shop.save
      redirect_to root_path
    end
  end

  private

    def set_shop
      @shop = Shop.find(params[:shop_id])
    end
end