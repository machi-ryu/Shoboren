class JoinsController < ApplicationController

    def create
        #current_user.joins.create(place_id: params[:place_id])
        current_user.joins.create(join_params)
        #@place = Place.find(myjoin.place_id)
        #@place = Join.all.places.find(join_params)
        @place = Place.find(params[:join][:place_id])
        #redirect_to root_path
        @places = Place.all.order(etime: :DESC)
        @joins = Join.all
        respond_to do |format|
            format.html { redirect_to controller: :places, action: :index }
            format.js { @place }
        end
    end

    def destroy
        current_user.joins.find_by(place_id: params[:place_id]).destroy
        @place = Place.find(params[:place_id])
        #redirect_to root_path
        respond_to do |format|
            format.html { redirect_to root_path}
            format.js { @place }
        end
    end

    def update
        @join = current_user.joins.find_by(place_id: params[:place_id])
        #@join.update_attribute(:attend_flg, params[:attend_flg])
        @join.update_attributes(join_params)
        redirect_to root_path
    end

    def update_sanka
        @join = current_user.joins.find_by(place_id: params[:place_id])
        if @join.sanka_flg == 1
            @join.sanka_flg = 0
        else
            @join.sanka_flg = 1
        end
        @join.save
        #redirect_to root_path
        @place = Place.find(params[:place_id])
        sanka_place = current_user.places.where("sanka_flg = (?)", 1)
        @sanka_place = sanka_place.order(etime: :DESC).first
        if @sanka_place.nil?
            @blank_term = 0
        else
            @blank_term = (Date.today - Date.parse(@sanka_place.etime.to_s)).to_i
        end
        @user = current_user
        respond_to do |format|
            format.html { redirect_to root_path }
            format.js
        end
    end

    def show
    end

    private
        def join_params
            params.require(:join).permit(:user_id, :place_id, :attend_flg)
        end

end
