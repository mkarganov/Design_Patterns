# pond = FrogPond.new(3) or DuckPond.new(3)
# pond.simulate_one_day

class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts("Duck #{@name} is eating.")
  end

  def speak
    puts("Duck #{@name} says Quack")
  end

  def sleep
    puts("Duck #{@name} sleeps quietly.")
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts "Frog #{@name} is eating."
  end

  def speak
    puts "Frog #{@name} says Crooooaaak!"
  end

  def sleep
    puts "Frog #{@name} doesn't sleep; he croaks all night!"
  end
end

class Pond
  def initialize(number_animals)
    @animals = []
    number_animals.times do |i|
      anilmal = new_animal("Animal#{i}")
      @animal << animal
    end
  end

  def simulate_one_day
    @animals.each {|animal| animal.speak}
    @animals.each {|animal| animal.eat}
    @animals.each {|animal| animal.sleep}
  end
end

class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end
