class BookingsController < ApplicationController


  def create
    @booking = Booking.new(booking_params)
    @booking.kitchen = @kitchen
    @booking.save
    redirect_to kitchens_path
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to kitchen_path(@booking.kitchen)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :confirmed)
  end

  def set_kitchen
    @kitchen = Kitchen.find(params[:kitchen_id])
  end
end
