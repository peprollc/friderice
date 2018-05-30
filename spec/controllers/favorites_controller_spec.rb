# frozen_string_literal: true

require "rails_helper"

RSpec.describe FavoritesController do
  describe "#create" do

    context "when sign_in" do
      subject { proc { post :create, params: { shop_id: shop.id } } }
      let(:shop) { create(:shop) }
      let(:user) { create(:user) }

      before { sign_in(user) }

      it :aggregate_failures do
        is_expected.to change { Favorite.count }.to(1).from(0)
        expect(response).to redirect_to root_path
      end
    end

    context "when not sign_in" do
      let(:shop) { create(:shop) }

      subject { proc { post :create, params: { shop_id: shop.id } } }

      it :aggregate_failures do
        is_expected.not_to change { Favorite.count }
        expect(response).to redirect_to root_path
        expect(flash[:error]).not_to be_nil
      end
    end
  end
end