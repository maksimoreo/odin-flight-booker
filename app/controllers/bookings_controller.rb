class BookingsController < ApplicationController
  def new
    @flight = Flight.includes(:from_airport, :to_airport).find(params[:flight_id])
    @booking = Booking.new(flight_id: params[:flight_id])
    params[:passengers].to_i.times { @booking.passengers.build }
    #@passengers = Array.new(params[:passengers].to_i) { Passenger.new }
  end

  def create
    @booking = Booking.new booking_params

    if @booking.save
      flash[:notice] = 'Booking successfully created'
      redirect_to @booking
    else
      flash[:alert] = "Couldn't create booking"
      render :new
    end
  end

  def show
    @booking = Booking.includes(:flight, :passengers).find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end
