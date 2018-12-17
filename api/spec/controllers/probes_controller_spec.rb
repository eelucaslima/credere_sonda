# frozen_string_literal: true

require "rails_helper"

RSpec.describe ProbesController, type: :controller do
  describe "POST start" do
    it "returns http success and blank body" do
      post :start

      expect(response).to be_successful
      expect(response.body).to be_blank
    end
  end

  describe "GET position" do
    it "returns a json with probe position" do
      expected_position = { x: 0, y: 0, face: :D }

      get :position

      expect(response.body).to eql(expected_position.to_json)
    end
  end

  describe "PUT move" do
    context "with allowed movements" do
      it "returns a json with probe location" do
        first_movements = { movimentos: ["M", "GE"] }
        last_movements = { movimentos: ["M", "GE"] }
        expected_location = { x: 1, y: 1 }

        put :move, params: first_movements
        put :move, params: last_movements

        expect(response.body).to eql(expected_location.to_json)
      end
    end

    context "with forbidden movements" do
      it "responds with invalid position" do
        movements = { movimentos: ["GD", "M", "M"] }
        expected_error = { "error"=>"Invalid position (0, -1)" }

        put :move, params: movements

        expect(response.body).to eql(expected_error.to_json)
      end

      it "responds with invalid movement if one movement isn't allowed" do
        movements = { movimentos: ["invalid_movement"] }
        expected_error = { "error"=>"Only arguments 'GE', 'GD' and 'M' are allowed" }

        put :move, params: movements

        expect(response.body).to eql(expected_error.to_json)
      end
    end
  end
end
