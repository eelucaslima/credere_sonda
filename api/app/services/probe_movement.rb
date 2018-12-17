# frozen_string_literal: true

module Services
  class ProbeMovement
    DIRECTION = {
      D: { x: +1, y: +0 },
      C: { x: +0, y: +1 },
      E: { x: -1, y: +0 },
      B: { x: +0, y: -1 }
    }.freeze

    def initialize(probe, movements)
      @probe = probe
      @movements = movements || []
    end

    def call
      @direction = DIRECTION[@probe.face.to_sym]
      @movements.each do |movement|
        action(movement)
      end
    end

    private

    def action(movement)
      case movement
      when "GE"
        turn_left
      when "GD"
        turn_right
      when "M"
        move
        getback if @probe.invalid_position?
      else
        raise SondaErrors::ProbeMovementError, "Only arguments 'GE', 'GD' and 'M' are allowed"
      end
    end

    def turn_left
      angle_rotation = +Math::PI / 2
      new_direction(angle_rotation)
    end

    def turn_right
      angle_rotation = -Math::PI / 2
      new_direction(angle_rotation)
    end

    def new_direction(angle_rotation)
      angle = Math.atan2(@direction[:y], @direction[:x])
      angle += angle_rotation
      @direction = { x: Math.cos(angle).round,
                     y: Math.sin(angle).round }
      @probe.face = DIRECTION.key(@direction)
    end

    def move
      @probe.x += @direction[:x]
      @probe.y += @direction[:y]
    end

    def getback
      raise SondaErrors::ProbePositionError, "Invalid position (#{@probe.x}, #{@probe.y})"
    end
  end
end
