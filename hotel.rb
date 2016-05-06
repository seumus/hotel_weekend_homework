require("pry-byebug")
class Hotel

  attr_accessor(:hotel_name, :rooms)

  def initialize(hotel_name, rooms)
    @hotel_name = hotel_name
    @rooms = rooms
  end


  def change_available(room)
    if room.who.length > 0
      room.available = "No"
    elsif room.who.length < 1
      room.available = "Yes"
    end
  end

  # def check_rooms()
  #   @rooms.each do |room|
  #     if room.max_persons == 1 && room.available == "Yes"
  #       #change_available(room)
  #       # room.who << person
  #       return room        #.who[0].name
  #       # room.change_available(room)
  #     end
  #     elsif bedroom.max_persons >= person.number_in_party && room.available == "Yes"
  #       #change_available(room)
  #       #room.who << person
  #       return room         #.who[0].name
  #   end
  # end


  def add_person_to_room(person)      #make this more dynamic
      @rooms.each do |room|
         if room.available == "Yes" && room.max_persons == person.number_in_party
          room.who << person
          change_available(room)
        return true
        end
      end
  end

 def check_in(person)
   result = add_person_to_room(person)
   if result != true
     return "No more rooms"
   end
 end





  def check_out(person, room)
    if room.who.length > 0
      return room.who.clear
      change_available(room)
    else
      puts "No one to check out"
    end
  end



end
