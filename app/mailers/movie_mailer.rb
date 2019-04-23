class MovieMailer < ApplicationMailer
  default from: 'hello@fakeflix.com'

  def movie_created
    @user = params[:user]
    @movie = params[:movie]
    mail(to: @user.email, subject: 'New movie created')
  end

  def movie_updated
    @user = params[:user]
    @movie = params[:movie]
    mail(to: @user.email, subject: 'Movie updated')
  end

  def movie_deleted
    @user = params[:user]
    @movie = params[:movie]
    mail(to: @user.email, subject: 'Movie deleted')
  end
end