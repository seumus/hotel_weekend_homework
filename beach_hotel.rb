require("pry-byebug")
require_relative('hotel_chain.rb')
class BeachHotel < HotelChain

  attr_accessor(:hotel_name, :rooms, :room_service, :deck_chairs)

  def initialize(hotel_name, rooms, room_service, deck_chairs)
    super(hotel_name, rooms, room_service)
    @deck_chairs = deck_chairs
  end

  def change_available(chair)
    if chair.available = "Yes"
      chair.available = "No"
    elsif chair.available = "No"
      chair.available = "Yes"
    end
  end

  def book_chair(chair, room)
    if chair.available == "Yes"
      room.bill << chair.chair_price
      chair.booking_name = room.who[0].name
      change_available(chair)
    end
  end



end
