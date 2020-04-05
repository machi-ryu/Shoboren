class UserController < ApplicationController
    before_action :authenticate_user!

    def show
        @user = current_user
        #id = Join.find_by(user_id: @user.id)
        #@places = Place.find(@user.join_ids)
        id = current_user.place_ids
        @places = Place.where("id IN (?)", id)
        @places2 = Place.all
    end
end
