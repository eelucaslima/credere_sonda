# frozen_string_literal: true

require "rails_helper"

RSpec.describe Probe, type: :model do
  it "goes to the initial position" do
    probe = Probe.new
    expected_position = { x: 0, y: 0, face: :D }

    expect(probe.position).to eql(expected_position)
  end
end
