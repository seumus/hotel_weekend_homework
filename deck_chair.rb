class DeckChair
  attr_accessor(:position, :chair_price, :available, :booking_name)
  def initialize(position, chair_price, available)
    @position = position
    @chair_price = chair_price
    @available = available
    @booking_name = booking_name
  end

  # def change_available(chair)
  #   if chair.who.length > 0
  #     chair.available = "No"
  #   elsif chair.who.length < 1
  #     chair.available = "Yes"
  #   end
  # end
  #
  # def book_chair(chair, room)
  #   if chair.available == "Yes"
  #     room.bill << chair.price
  #     chair.booking_name = room.who[0].name
  #     change_available(chair)
  #   end
  # end

end
