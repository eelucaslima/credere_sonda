# frozen_string_literal: true

class Probe
  attr_accessor :x, :y, :face

  def initialize
    initial_position
  end

  def initial_position
    self.x = 0
    self.y = 0
    self.face = :D
  end

  def location
    { x: x, y: y }
  end

  def position
    { x: x, y: y, face: face }
  end

  def invalid_position?
    x.negative? || y.negative? || x > 4 || y > 4
  end
end
