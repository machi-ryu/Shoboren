class PlacesController < ApplicationController
    before_action :authenticate_user!

    def index
        @places = Place.all.order(etime: :DESC)
        @joins = Join.all
    end

    def show
        @place = Place.find(params[:id])
        @p_joins = Join.all.where("place_id = (?)", params[:id])
        @p_users = User.where("id IN (?)", @place.user_ids)
        @post = Post.new
        @posts = @place.posts.order(created_at: :DESC)
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

    def edit
        @place = Place.find(params[:id])
    end

    def update
        @place = Place.find(params[:id])    
        if @place.update_attributes(place_params)
           redirect_to @place 
        else
            render 'edit'
        end
    end

    private
        def place_params
            params.require(:place).permit(:name, :menu, :intention_state , :stime, :etime)
        end

end
