class SearchShopsController < ApplicationController
  def create
    shop_search_form = ::ShopSearchForm.new shop_search_form_params
    if shop_search_form.get
      @shops = shop_search_form.build_shops
      respond_to do |format|
        format.js
      end
    end
  end

  private

    def shop_search_form_params
      params.require(:shop_search_form).permit(:keyword)
    end
end