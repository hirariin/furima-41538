class OrderShippingAddress
  include ActiveModel :: Model
  attr_accessor :user_id, :item_id, :order_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :order_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Must be 10 to 11 digits long and contain only numbers" }
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

end