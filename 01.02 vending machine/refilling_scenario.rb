require_relative 'vending_machine'

# We instantiate an **empty** vending machine selling 2.5 euros snacks.
vending_machine = VendingMachine.new(snack_price_cents: 250, snacks: 0)
puts "Vending machine ready"
puts vending_machine.display

# A technician comes and refill the vending machine with 20 snacks.
puts "Technician filling machine with 20 snacks"
vending_machine.snacks += 20
puts vending_machine.display


# Buying scenario
puts "Inserting 2€"
vending_machine.insert_coin(200)
puts vending_machine.display

3.times do
  puts "Inserting 0.2€"
  vending_machine.insert_coin(20)
  puts vending_machine.display
end

# Then the client pushes the Buy snack button
puts "Pushing 'Buy Snack' button"
vending_machine.buy_snacks
puts vending_machine.display

# Then the client pushes the Buy snack button again (but forgot to insert some more coins!)
puts "Pushing 'Buy Snack' button"
vending_machine.buy_snacks
puts vending_machine.display
