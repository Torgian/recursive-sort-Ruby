class MyCar
  attr_accessor :year, :color, :model, :speed, :on
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @on = 1
  end

  def speed_up
    self.speed += 10
    puts speed
  end

  def brake
    if self.speed == 0
      puts "You aren't moving! Yet you keep pushing the brake..."
    elsif self.speed >= 10
      self.speed -= 10
      puts "You slow down to #{self.speed} kilometers an hour."
    end
  end

  def shut_off
    if self.on == 0
      puts "Your car is already off."
    else
      self.on = 0
      puts "You turn off your car. The engine falls silent."
    end
  end

  def turn_on
    if self.on == 0
      self.on = 1
      puts "The car's engine rumbles and sparks to life."
    else
      puts "Your car is already running!"
    end
  end
end


