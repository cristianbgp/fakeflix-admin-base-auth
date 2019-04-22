class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    authorize(Movie)
    @movies = Movie.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @movies}
    end
  end

  def new
    authorize(Movie)
    @movie = Movie.new
  end

  def edit
    authorize(Movie)
  end
  
  def show
    authorize(Movie)
  end

  
  def create
    authorize(Movie)
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie), notice: 'movie was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize(Movie)
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: 'movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize(Movie)
    @movie.destroy
    redirect_to movies_path, notice: 'Movie was successfully destroyed.'
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title ,:description ,:rating ,:duration ,:price ,:status ,:progress)
  end
end

