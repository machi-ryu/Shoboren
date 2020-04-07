class JoinsController < ApplicationController

    def create
        current_user.joins.create(place_id: params[:place_id])
        redirect_to root_path
    end

    def destroy
        current_user.joins.find_by(place_id: params[:place_id]).destroy
        redirect_to root_path
    end

end
