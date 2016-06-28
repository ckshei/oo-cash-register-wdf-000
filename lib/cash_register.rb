require 'pry'
class CashRegister

  attr_accessor :total, :discount, :quantity, :title

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @prices = {}
  end

  def add_item(title, price, quantity=1)
    @total = @total + price * quantity
    quantity.times { @items << title }
    @prices[title] = price
    # binding.pry
  end

  def apply_discount
    # binding.pry
    if @total == @total * (1-@discount/100.0)
      "There is no discount to apply."
    else
      @total = @total * (1-@discount/100.0)
      "After the discount, the total comes to $#{@total.round}."
    end
  end

  def items
   @items 
  end

  def void_last_transaction
    @total = @total - @prices[@items.pop]
  end

end
