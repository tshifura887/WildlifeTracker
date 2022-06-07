class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[ show edit update destroy ]


  def index
    @animals = Animal.all
  end

  
  def show
    @animal = Animal.find(params[:id])
  end

  
  def new
    @animal = Animal.new
  end

  
  def edit
    @animal = Animal.find(params[:id])
  end

  
  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      redirect_to @animal
    else   
      render :new
    end
  end

  
  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to @animal
    else  
      render :edit
    end
  end

  
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to root_path
  end

  private
    
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def animal_params
      params.require(:animal).permit(:name)
    end
end
