# frozen_string_literal: true

require "rails_helper"

RSpec.describe Probe, type: :model do
  it "goes to the initial position" do
    probe = Probe.new
    position = probe.position

    expected_position = { x: 0, y: 0, face: :D }

    expect(position).to eq(expected_position)
  end
end
