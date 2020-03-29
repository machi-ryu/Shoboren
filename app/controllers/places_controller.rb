class PlacesController < ApplicationController

    def show
        @place = Place.find(params[:id])
    end

    def index
        @places = Place.all
    end

end
