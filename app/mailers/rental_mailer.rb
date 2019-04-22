class RentalMailer < ApplicationMailer
  default from: 'hello@fakeflix.com'

  def rental_created
    @user = params[:user]
    @rental = params[:rental]
    mail(to: @user.email, subject: 'New rental created')
  end
end
