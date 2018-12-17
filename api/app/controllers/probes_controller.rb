# frozen_string_literal: true

class ProbesController < ApplicationController
  before_action :load_probe
  after_action :save_probe

  def start
    @probe.initial_position
    render status: :ok
  end

  def position
    render json: @probe.position, status: :ok
  end

  def move
    Services::ProbeMovement.new(@probe, probe_movements).call
    render json: @probe.location, status: :ok
  end

  private

  def load_probe
    @probe = session[:_probe] || Probe.new
  end

  def save_probe
    session[:_probe] = @probe
  end

  def probe_movements
    params.require(:movimentos)
  end
end
