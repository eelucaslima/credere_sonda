# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from SondaErrors::ProbeMovementError, with: :render_an_error
  rescue_from SondaErrors::ProbePositionError, with: :render_an_error

  def render_an_error(error)
    render json: { error: error }, status: :bad_request
  end
end
