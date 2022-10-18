class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

  belongs_to :user
end
