class VendingMachine

  attr_accessor :amount_cents, :snack_price_cents, :snacks

  def initialize(properties = {})
    @amount_cents = 0
    @snacks = properties[:snacks]
    @snack_price_cents = properties[:snack_price_cents]
  end

  def insert_coin(value_cents)
    @amount_cents += value_cents
  end

  def buy_snacks
    if @snacks > 0 && (@amount_cents >= @snack_price_cents)
      @snacks -= 1
      @amount_cents -= @snack_price_cents
      puts "Enjoy your food :)"
    else
      puts "You don't insert money enough :/ or we don't have this food"
    end
  end

  def display
    return "---> Amount: #{@amount_cents / 100.0}€" \
      " - 1 Snack = #{@snack_price_cents / 100.0}€" \
      " - Stock: #{@snacks}"
  end
end
