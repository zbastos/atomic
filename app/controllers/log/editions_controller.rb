class Log::EditionsController < ApplicationController
  before_action :set_edition, only: [:destroy]

  def index
    @editions = Log::Edition.all
  end

  def new
    @edition = Log::Edition.new
  end

  def create
    @edition = Log::Edition.new(edition_params)
    set_date

    if @edition.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def destroy
    @edition.destroy
    redirect_to log_editions_url
  end

  private

    def set_edition
      @edition = Log::Edition.find(params[:id])
    end

    def set_date
      date = params[:date]
      @edition.date = Date.new(date["year"].to_i,
                               date["month"].to_i,
                               date["day"].to_i)
    end

    def edition_params
      params.require(:log_edition).permit(:date, :document)
    end
end
