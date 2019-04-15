class Admin::SeriesController < ApplicationController
  before_action :set_serie, only: [:show, :edit, :update, :destroy]

  def index
    @series = Serie.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @series}
    end
  end

  def new
    @serie = Serie.new
  end

  def edit
  end
  
  def show
  end

  
  def create
    @serie = Serie.new(serie_params)
    if @serie.save
      redirect_to admin_series_path(@serie), notice: 'Serie was successfully created.'
    else
      render :new
    end
  end

  def update
    @serie = Serie.find(params[:id])
    if @serie.update(serie_params)
      redirect_to admin_series_path(@serie), notice: 'Serie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @serie.destroy
    redirect_to admin_series_index_path, notice: 'Serie was successfully destroyed.'
  end

  private
  def set_serie
    @serie = Serie.find(params[:id])
  end

  def serie_params
    params.require(:serie).permit(:title ,:description ,:rating , :price ,:status)
  end
end
