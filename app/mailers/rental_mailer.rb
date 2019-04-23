class RentalMailer < ApplicationMailer
  default from: 'hello@fakeflix.com'

  def rental_created
    @user = params[:user]
    @rental = params[:rental]
    mail(to: @user.email, subject: 'New rental created')
  end

  def rental_updated
    @user = params[:user]
    @rental = params[:rental]
    mail(to: @user.email, subject: 'Rental updated')
  end

  def rental_deleted
    @user = params[:user]
    @rental = params[:rental]
    mail(to: @user.email, subject: 'Rental deleted')
  end
end
