class UserController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = current_user
        #id = Join.find_by(user_id: @user.id) #ミス find,find_byは１つしか引っ張れない
        #@places = Place.find(@user.join_ids)
        id = current_user.place_ids
        @places = Place.where("id IN (?)", id)
        @places2 = Place.all

        sanka_place = current_user.places.where("sanka_flg = (?)", 1)
        @sanka_place = sanka_place.order(etime: :DESC).first
        sanka_date = Date.parse(@sanka_place.etime.to_s)
        today = Date.today
        @blank_term = (today - sanka_date).to_i
    end

end
