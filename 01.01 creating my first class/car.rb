require 'pry-byebug'

class Car

  attr_accessor :name, :brand

  def initialize(options ={})
    @name = options[:name]
    @brand = options[:brand]
  end
end

binding.pry
options = {name: "uno", brand: "fiat"}
x = Car.new(options)
puts x
