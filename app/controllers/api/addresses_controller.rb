class Api::AddressesController < ApplicationController
  before_action :set_address, only: [:show, :update, :destroy]
  
  def index
    render json: Address.all
  end

  def show
    render json: @address
  end

  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: { errors: @address.errors.full_messages.join(',') }, status: :bad_request
    end
  end

  def create
    address.new(address_params)
    if address.save
      render json: address
    else
      render json: { errors: address.errors.full_messages.join(',') }, status: :bad_request
    end
  end

  def destroy
    @address.destroy
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:city, :street, :zip)
    end
end
