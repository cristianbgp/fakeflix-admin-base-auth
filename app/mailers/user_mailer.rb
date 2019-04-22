class UserMailer < ApplicationMailer
  default from: 'hello@fakeflix.com'

  def user_created
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to FakeFlix')
  end
end
