class Api::LocationsController < ApplicationController
  before_action :set_location, :only [:show, :update, :destroy]
  
  def index
    render json: Location.all
  end

  def show
    render json: @location
  end

  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: { errors: @location.errors.full_messages.join(',') }, status: :bad_request
    end
  end

  def create
    location.new(location_params)
    if location.save
      render json: location
    else
      render json: { errors: location.errors.full_messages.join(',') }, status: :bad_request
  end

  def destroy
    @location.destroy
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name)
    end
end
