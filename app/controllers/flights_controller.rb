class FlightsController < ApplicationController
  def index
    @flights = Flight.all.includes(:from_airport, :to_airport)
  end
end
