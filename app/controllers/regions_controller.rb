class RegionsController < ApplicationController
    before_action :set_region, only: %i[ show edit update destroy ]


  def index
    @regions = Region.all
  end

  
  def show
    @region = Region.find(params[:id])
  end

  
  def new
    @region = Region.new
  end

  
  def edit
    @region = Region.find(params[:id])
  end

  
  def create
    @region = Region.new(region_params)

    if @region.save
      redirect_to @region
    else   
      render :new
    end
  end

  
  def update
    @Region = Region.find(params[:id])
    if @region.update(region_params)
      redirect_to @region
    else  
      render :edit
    end
  end

  
  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    redirect_to @region
  end

  private
    
    def set_region
      @region = Region.find(params[:id])
    end

    def region_params
      params.require(:region).permit(:name)
    end
end
