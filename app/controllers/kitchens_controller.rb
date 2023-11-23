class KitchensController < ApplicationController
  def index
    @kitchens = Kitchen.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR equipment ILIKE :query OR address ILIKE :query"
      @kitchens = @kitchens.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @markers = @kitchens.geocoded.map do |kitchen|
      {
        lat: kitchen.latitude,
        lng: kitchen.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {kitchen: kitchen}),
        marker_html: render_to_string(partial: "marker")
      }
    end

  end

  def new
    @kitchen = Kitchen.new
  end

  def destroy
    @kitchen = Kitchen.find(params[:id])
    @kitchen.destroy
    redirect_to dashboard_path, status: :see_other
  end

  def show
    @kitchen = Kitchen.find(params[:id])
    @booking = Booking.new
    if @kitchen.geocode
      @marker = [
      lat: @kitchen.geocode[0],
      lng: @kitchen.geocode[1],
      info_window_html: render_to_string(partial: "info_window", locals: {kitchen: @kitchen}),
      marker_html: render_to_string(partial: "marker")
      ]
    end
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

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def update
    @kitchen = Kitchen.find(params[:id])
    @kitchen.update(kitchen_params)
    redirect_to kitchen_path(@kitchen)
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name, :address, :capacity, :price, :equipment, photos: [])
  end
end
