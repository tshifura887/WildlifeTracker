class SightingsController < ApplicationController
    
    before_action :set_animal

    def index
        if (params[:begin_date].present?) and (params[:end_date].present?)
            begin_date, end_date = params[:begin_date].to_date, params[:end_date].to_date
            @sightings = @animal.sightings.where(date: begin_date..end_date) and (@animal.sightings.where(region_id: params[:region_id]))
        else  
            @sightings = @animal.sightings.all
        end
    end

    def create
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.create(sighting_params)
        redirect_to animal_path(@animal)
      end

    def destroy
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.find(params[:id])
        @sighting.destroy
        redirect_to animal_path(@animal)
    end

    private
       

       def set_animal
         @animal = Animal.find(params[:animal_id])
       end

       def sighting_params
        params.require(:sighting).permit(:latitude, :longitude, :date, :region_id)
       end
end
