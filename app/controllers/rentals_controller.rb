class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    authorize(Rental)
    @rentals = Rental.all
  end

  def new
    authorize(Rental)
    @rental = Rental.new
  end

  def edit
    authorize(Rental)
  end
  
  def show
    authorize(Rental)
  end

  
  def create
    authorize(Rental)
    @rental = Rental.new(rental_params)
    if @rental.save
      SendRentalCreatedNotificationJob.perform_later @rental
      RentalMailer.with(user: current_user, rental: @rental).rental_created.deliver_later
      redirect_to rental_path(@rental), notice: 'Serie was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize(Rental)
    @rental = Rental.find(params[:id])
    if @rental.update(rental_params)
      RentalMailer.with(user: current_user, rental: @rental).rental_updated.deliver_later
      redirect_to rental_path(@rental), notice: 'Serie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize(Rental)
    RentalMailer.with(user: current_user, rental: @rental).rental_deleted.deliver_now
    @rental.destroy
    redirect_to rentals_path, notice: 'Serie was successfully destroyed.'
  end

  private
  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:paid_price, :rentable_type, :rentable_id)
  end
end
