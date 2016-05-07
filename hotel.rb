require("pry-byebug")
require_relative('hotel_chain.rb')
class Hotel < HotelChain

  attr_accessor(:hotel_name, :rooms, :room_service)

  def initialize(hotel_name, rooms, room_service)
    super(hotel_name, rooms, room_service)
    @pool = pool
  end



end
