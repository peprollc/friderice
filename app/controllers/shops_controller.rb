class ShopsController < ApplicationController
  def new
  end

  def create
    shop_form = ShopForm.new shop_params
    if shop_form.save
      session[:user_id] = shop_form.user.id
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def shop_params
    params.require(:shop_form).permit(:username, :shop_name, :address)
  end
end