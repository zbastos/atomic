class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  def index
    #@partners = Partner.all
    @partners = Partner.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @partner = Partner.new
  end

  def edit
  end

  def create
    @partner = Partner.new(partner_params)

    if @partner.save
      redirect_to @partner, notice: 'Partner was successfully created.'
    else
      render :new
    end
  end

  def update
    if @partner.update(partner_params)
      redirect_to @partner, notice: 'Partner was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    Partner.find(params[:id]).try(:destroy)
    redirect_to partners_url
  end

  private
    def set_partner
      @partner = Partner.find(params[:id])
    end

    def partner_params
      params.require(:partner).permit(:name, :benefits, :logo)
    end
end
