class KitchensController < ApplicationController
  def index
    @kitchens = Kitchen.all
  end

  before_action :set_user, only: %i[new create]

  def new
    @user = User.find(params[:user_id])
    @kitchen = Kitchen.new
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def kitchen_params
    params.require(:kitchen).permit(:content)
  end
end
