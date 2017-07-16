require 'pry-byebug'
class OrangeTree

  attr_accessor :age, :height, :fruits, :dead

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
  end

  def one_year_passes!
    @age += 1
    @age.between?(6, 9) ? @fruits = 100 : @fruits = @fruits
    @age.between?(10, 14) ? @fruits = 200 : @fruits = @fruits
    @fruits = 0 if @age > 15
  end

  def dead?
    @age >= 100 ? @dead = true : @dead = false
  end

  def pick_a_fruit!
    @fruits > 0 ? @fruits -= 1 : @fruits
  end
end


binding.pry
x = OrangeTree.new
x.one_year_passes!
30.times do
  x.one_year_passes!
end

20.times do
  x.pick_a_fruit!
end

