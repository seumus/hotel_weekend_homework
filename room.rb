class Room
attr_accessor(:number, :beds, :available, :price, :who, :max_persons, :bill, :receipt)
  def initialize(number,beds,available, price,max_persons)
    @number = number
    @beds = beds
    @available = available
    @price = price
    @who = Array.new
    @max_persons = max_persons
    @bill = Array.new
    @receipt = Array.new
  end

  def prices_list()

  end

  def total_bill()
    prices = []
    @bill.each {|item| prices << item}
    sum = 0
    total = prices.inject{|sum, price| sum + price}
    sum += total
    return sum
  end




end
