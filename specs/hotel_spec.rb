require('pry-byebug')
require('minitest/autorun')
require_relative('../hotel.rb')
require_relative('../people.rb')
require_relative('../room.rb')
require_relative('../room_service.rb')

class TestHotel < Minitest::Test

def setup
  @room1 = Room.new(1, "Double", "Yes",  75, 2)
  @room2 = Room.new(2, "Single", "Yes",  50, 1)
  @room3 = Room.new(3, "Twin", "Yes", 75, 2)
  @room4 = Room.new(4, "Double", "Yes", 75, 2)
  @room5 = Room.new(5, "Single", "Yes", 50, 1)
  @room6 = Room.new(6, "Penthouse", "Yes", 1000, 4)

  @food1 = RoomService.new("Cheeseburger", 5)
  @food2 = RoomService.new("Pizza", 7.50)
  @wine = RoomService.new("Pinot Grigio", 22)
  @champagne = RoomService.new("Moet", 50)
  room_service = [@food1,@food2,@wine,@champagne]


  @guest1 = People.new("Mr","Jim", 1)
  @guest2 = People.new("Miss", "Claudia", 2)
  @guest3 = People.new("Mr","Dwight", 4)
  @guest4 = People.new("Mr", "Michael", 1)
  @guest5 = People.new("Mr", "Crabby", 1)
  @guest6 = People.new('Mrs', "Gael", 2)
  rooms = [@room1,@room2,@room3,@room4,@room5,@room6]
  @hotel = Hotel.new("Faulty Towers", rooms, room_service)
end

  def test_check_in()
    @hotel.check_in(@guest1)
    assert_equal("Jim", @room2.who[0].name)
    # print @room2.who
    @hotel.check_in(@guest2)
    assert_equal("Claudia", @room1.who[0].name)
    # print @room1.who
    @hotel.check_in(@guest4)
    assert_equal("Michael", @room5.who[0].name)
    # print @room5.who
    @hotel.add_person_to_room(@guest3)
    assert_equal("Dwight", @room6.who[0].name)
    @hotel.add_person_to_room(@guest6)
    assert_equal("Gael", @room3.who[0].name)
    @hotel.add_person_to_room(@guest5)
    assert_equal("No more rooms", @hotel.check_in(@guest5))
    assert_equal("No", @hotel.change_available(@room2))
    assert_equal("No", @hotel.change_available(@room6))

  end


  def test_check_out()
    @hotel.add_person_to_room(@guest1)
    assert_equal([], @hotel.check_out(@guest1, @room2))
  end

  def test_change_available()
    @hotel.add_person_to_room(@guest1)
    assert_equal("No", @hotel.change_available(@room2))
  end

  def test_order_room_service()
    @hotel.check_in(@guest1)
    @hotel.order_room_service(@room2,@food1)
    assert_equal([50, 5], @room2.bill)
  end

  def test_total_bill()
    @hotel.check_in(@guest1)
    @hotel.check_in(@guest3)
    @hotel.order_room_service(@room2,@food1)
    @hotel.order_room_service(@room2,@wine)
    @hotel.order_room_service(@room6,@food2)
    @hotel.order_room_service(@room6,@champagne)
    assert_equal(77, @room2.total_bill)
    assert_equal(1057.5, @room6.total_bill)
    assert_equal(["Cheeseburger", "Pinot Grigio", "Room Price", ["Total due: 77"]], @hotel.print_receipt(@room2))
  end


end
