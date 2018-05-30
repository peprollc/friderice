class ShopsController < ApplicationController
  def new
  end

  def create
    shop_form = ShopForm.new shop_params
    if shop_form.save
      session[:user_id] = shop_form.user.id
      respond_to do |format|
        format.js
        format.html { redirect_to root_path }
      end
    else
      flash[:errors] = shop_form.errors.full_messages
      respond_to do |format|
        format.js
        format.html { render :new }
      end
    end
  end


  private

  def shop_params
    params.require(:shop_form).permit(:username, :name, :address)
  end
end