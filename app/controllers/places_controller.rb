class PlacesController < ApplicationController
    before_action :authenticate_user!

    def index
        @places = Place.all
        @joins = Join.all
    end

    def show
        @place = Place.find(params[:id])
    end

    def new
        @place = Place.new
    end

    def create
        @place = Place.new(place_params)
        if @place.save
            redirect_to @place
        else
            render 'new'
        end
    end

    private
        def place_params
            params.require(:place).permit(:name, :menu, :intention_state , :stime, :etime)
        end

end
