# frozen_string_literal: true

require "rails_helper"

RSpec.describe Services::ProbeMovement, type: :service do
  let!(:probe) { Probe.new }

  it "turns the probe to the left " do
    movement = ["GE"]

    Services::ProbeMovement.new(probe, movement).call

    expect(probe.face).to eql(:C)
  end

  it "turns the probe to the right " do
    movement = ["GD"]

    Services::ProbeMovement.new(probe, movement).call

    expect(probe.face).to eql(:B)
  end

  it "moves the probe on the x-axis" do
    movement = ["M"]

    Services::ProbeMovement.new(probe, movement).call

    expect(probe.x).to eql(1)
  end

  it "moves the probe on the y-axis" do
    movements = ["GE", "M"]

    Services::ProbeMovement.new(probe, movements).call

    expect(probe.y).to eql(1)
  end

  it "raises an error if an input is invalid movement" do
    movement = ["invalid movement"]

    service = Services::ProbeMovement.new(probe, movement)

    expect { service.call }.to raise_error(SondaErrors::ProbeMovementError)
  end

  it "raises an error if the moves lead to an invalid position" do
    movement = ["M", "M", "M", "M", "M"]

    service = Services::ProbeMovement.new(probe, movement)

    expect { service.call }.to raise_error(SondaErrors::ProbePositionError)
  end
end
