class Shop < ApplicationRecord
  DO_DRAFT_LIMIT_COUNT = 5
  has_many :images, class_name: 'ShopImage'
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user', autosave: true
  has_many :unfavorites
  has_many :unfavorite_users, through: :unfavorites, source: 'user', autosave: true

  validates :name, uniqueness: true

  after_save :limit_delete!

  enum status: { draft: 0, published: 1 }

  def vote_by?(user)
    favorite_users.include?(user) || unfavorite_users.include?(user)
  end

  def vote_favorite?(user)
    favorite_users.include?(user)
  end

  private

    def limit_delete!
      draft! if unfavorite_users.count >= DO_DRAFT_LIMIT_COUNT
    end
end
