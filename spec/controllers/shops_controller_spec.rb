# frozen_string_literal: true

require "rails_helper"

RSpec.describe ShopsController do
  describe "#new" do
    before { get :new }
    it { expect(response).to have_http_status :ok }
  end

  describe "#create" do
    subject { proc { post :create, params: { shop_form: attributes } } }

    let(:attributes) { attributes_for(:shop).merge({ username: username }) }
    let(:username) { "sample" }

    it :aggregate_failures do
      is_expected.to change { Shop.count }.to(1).from(0).and \
        change { User.count }.to(1).from(0)
      expect(response).to redirect_to root_path
      expect(controller.current_user.name).to eq username
    end
  end
end