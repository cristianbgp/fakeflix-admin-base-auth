class SeriesController < ApplicationController
  before_action :set_serie, only: [:show, :edit, :update, :destroy]

  def index
    authorize(Serie)
    @series = Serie.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @series}
    end
  end

  def new
    authorize(Serie)
    @serie = Serie.new
  end

  def edit
    authorize(Serie)
  end
  
  def show
    authorize(Serie)
  end

  
  def create
    authorize(Serie)
    @serie = Serie.new(serie_params)
    if @serie.save
      SerieMailer.with(user: current_user, serie: @serie).serie_created.deliver_later
      redirect_to series_path(@serie), notice: 'Serie was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize(Serie)
    @serie = Serie.find(params[:id])
    if @serie.update(serie_params)
      SerieMailer.with(user: current_user, serie: @serie).serie_updated.deliver_later
      redirect_to series_path(@serie), notice: 'Serie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize(Serie)
    @serie.destroy
    SerieMailer.with(user: current_user, serie: @serie).serie_deleted.deliver_now
    redirect_to series_index_path, notice: 'Serie was successfully destroyed.'
  end

  private
  def set_serie
    @serie = Serie.find(params[:id])
  end

  def serie_params
    params.require(:serie).permit(:title ,:description ,:rating , :price ,:status)
  end
end
