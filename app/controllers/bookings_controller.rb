class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @kitchen = Kitchen.find(params[:kitchen_id])
    @booking.kitchen = @kitchen
    @booking.user = current_user
    @booking.save
    redirect_to dashboard_path
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.update(confirmed: true)
    redirect_to dashboard_path, notice: 'Réservation confirmée avec succès.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :confirmed)
  end

  def set_kitchen
    @kitchen = Kitchen.find(params[:kitchen_id])
  end
end
