class FlightsController < ApplicationController
  def index
    if params[:commit] == 'Search'
      @flights = Flight.where(from_airport: Airport.find_by_name(params[:from]), to_airport: Airport.find_by_name(params[:to]), start: params[:date]).all
    else
      @flights = Flight.all.includes(:from_airport, :to_airport)
    end
  end
end
