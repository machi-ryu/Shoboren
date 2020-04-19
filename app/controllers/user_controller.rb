class UserController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = current_user
        #id = Join.find_by(user_id: @user.id) #ミス find,find_byは１つしか引っ張れない
        #@places = Place.find(@user.join_ids)
        id = current_user.place_ids
        @places = Place.where("id IN (?)", id).order(etime: :DESC)
        #@places2 = Place.all

        myplace = Place.where("id IN (?)", id)
        future_place = myplace.where("stime >= (?)", DateTime.now)
        @recently_place = future_place.order(:stime).first

        sanka_place = current_user.places.where("sanka_flg = (?)", 1)
        @sanka_place = sanka_place.order(etime: :DESC).first
        if @sanka_place.nil?
            @blank_term = 0
        else
            @blank_term = (Date.today - Date.parse(@sanka_place.etime.to_s)).to_i
        end

        @joins = current_user.joins

    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :level, :email)
        end

end
