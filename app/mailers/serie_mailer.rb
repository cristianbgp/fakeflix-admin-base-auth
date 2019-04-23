class SerieMailer < ApplicationMailer
  default from: 'hello@fakeflix.com'

  def serie_created
    @user = params[:user]
    @serie = params[:serie]
    mail(to: @user.email, subject: 'New serie created')
  end

  def serie_updated
    @user = params[:user]
    @serie = params[:serie]
    mail(to: @user.email, subject: 'Serie updated')
  end

  def serie_deleted
    @user = params[:user]
    @serie = params[:serie]
    mail(to: @user.email, subject: 'Serie deleted')
  end
end