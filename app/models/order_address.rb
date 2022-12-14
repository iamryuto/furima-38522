class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :zip, :city, :address, :phone_number, :building, :prefecture_id, :order_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :zip, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}+\z/, message: 'is invalid. Input only number' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, address: address, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
