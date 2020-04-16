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
            params.require(:user).permit(:name, :email)
        end

end
