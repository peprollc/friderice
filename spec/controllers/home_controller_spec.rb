# frozen_string_literal: true

require "rails_helper"

RSpec.describe HomeController do
  describe "#index" do
    let(:shops) { create_list(:shop, 2) }

    before do
      shops
      get :index
    end

    it do
      expect(response).to have_http_status :ok
      expect(assigns(:shops)).to match_array(shops)
    end
  end
end