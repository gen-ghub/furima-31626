class Shopping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :town, :town_number, :building_name, :phone_number, :token, :price



  with_options presence: true do
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :town
  validates :town_number
  validates :token
  validates :phone_number
  end

  validates :area_id,  numericality: { other_than: 0, message: "can't be blank" }

  
  validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is enter within 11 digits" }, unless: :phone_box?

  def phone_box?
    phone_number == nil
  end




  def save
    price_record = PriceRecord.create( user_id: user_id, item_id: item_id)

    HomeAddress.create(postal_code: postal_code, area_id: area_id, town: town, town_number: town_number, building_name: building_name, phone_number: phone_number, price_record_id: price_record.id)

  end

end

