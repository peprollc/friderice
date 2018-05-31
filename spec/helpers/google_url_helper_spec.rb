# frozen_string_literal: true

require "rails_helper"

RSpec.describe GoogleUrlHelper, type: :helper do
  describe "#google_map_tag" do
    subject { helper.google_map_tag(address, options) }

    context "only address" do
      let(:address) { "東京都港区" }
      let(:result) { URI.escape(GoogleUrlHelper::GOOGLE_MAP_URL + "&query=" + address) }
      let(:options) { {} }

      it { is_expected.to eq result }
    end

    context "has options" do
      let(:address) { "東京都港区" }
      let(:options) { { zoom: 20 } }
      let(:result) { URI.escape(GoogleUrlHelper::GOOGLE_MAP_URL + "&query=" + address + "&zoom=20") }

      it { is_expected.to eq result }
    end
  end
end