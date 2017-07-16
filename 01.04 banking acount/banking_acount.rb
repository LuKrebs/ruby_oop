# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the balance variable)

  MIN_DEPOSIT = 100

  attr_accessor :name, :balance, :password, :initial_deposit

  def initialize(options = {})
    @initial_deposit = options[:initial_deposit]
    fail DepositError, "Insufficient deposit" unless @initial_deposit >= MIN_DEPOSIT

    @password     = options[:password]
    @transactions = []
    @balance      = 0
    @name         = options[:name]
    @iban         = options[:iban]

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    add_transaction(-amount)
    "You withdraw #{amount}"
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    add_transaction(amount)
    "You deposit #{amount}"
  end

  def transactions_history(args = {})
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!
    return "no password given" if args[:password].nil?
    return "wrong password" if !args[:password].nil? && args[:password] != @password
    return @transactions.to_s if args[:password] == @password
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    "#{@iban[0, 4]}**************#{@iban[-3, @iban.length]}"
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: return a string with the account owner, the hidden iban and the balance of the account
    "Owner: #{@name} - IBAN: #{iban} - Balance: #{@balance} euros"
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    # TODO: update the current balance (which represents the balance of the account)
    @transactions << amount
    @balance += amount
  end
end


x = BankAccount.new(name: "Luciano", iban: "4444333322221111", initial_deposit: 100, password: "12345")
x.withdraw(20)
x.deposit(1000000)
puts x

