class Room
attr_accessor(:number, :beds, :available, :price, :who, :max_persons, :bill)
  def initialize(number,beds,available, price,max_persons)
    @number = number
    @beds = beds
    @available = available
    @price = price
    @who = Array.new
    @max_persons = max_persons
    @bill = bill
  end






end
