class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :fee
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :day

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX,
                              message: 'is invalid. Input half-width characters'

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  belongs_to :user
  has_one :order
  has_one_attached :image
  
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :day_id, numericality: { other_than: 1, message: "can't be blank" }
end
