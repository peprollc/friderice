# frozen_string_literal: true

require "rails_helper"

RSpec.describe Shop, type: :model do
  let(:shop) { create(:shop, unfavorite_users: users, status: "published") }
  let(:users) { create_list(:user, 4) }
  let(:last_user) { create(:user) }

  before do
    shop.unfavorites.build(user_id: last_user.id)
    shop.save
  end

  it { expect(shop.reload.status).to eq "draft" }
end