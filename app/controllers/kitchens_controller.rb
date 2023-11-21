class KitchensController < ApplicationController
  def index
    @kitchens = Kitchen.all
  end

  def new
    @kitchen = Kitchen.new
  end

  def destroy
    @kitchen = Kitchen.find(params[:id])
    @kitchen.destroy
    redirect_to kitchens_path, status: :see_other
  end

  def show
    @kitchen = Kitchen.find(params[:id])
    @booking = Booking.new
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.user = current_user
    @kitchen.save
    if @kitchen.save
      redirect_to kitchen_path(@kitchen)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name, :address, :capacity, :price, :equipment, photos: [])
  end
end
