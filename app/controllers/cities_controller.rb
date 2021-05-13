class CitiesController < ApplicationController
  def show
    @city=City.find(params[:id])
    @city_gossips = @city.find_gossips
  end
end
