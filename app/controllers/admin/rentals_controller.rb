class Admin::RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def edit
  end
  
  def show
  end

  
  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to admin_rental_path(@rental), notice: 'Serie was successfully created.'
    else
      render :new
    end
  end

  def update
    @rental = Rental.find(params[:id])
    if @rental.update(rental_params)
      redirect_to admin_rental_path(@rental), notice: 'Serie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @rental.destroy
    redirect_to admin_rentals_path, notice: 'Serie was successfully destroyed.'
  end

  private
  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:paid_price, :rentable_type, :rentable_id)
  end
end
