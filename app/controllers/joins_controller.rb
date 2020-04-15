class JoinsController < ApplicationController

    def create
        current_user.joins.create(place_id: params[:place_id])
        redirect_to root_path
    end

    def destroy
        current_user.joins.find_by(place_id: params[:place_id]).destroy
        redirect_to root_path
    end

    def update
        @join = current_user.joins.find_by(place_id: params[:place_id])

        #if params[:attend_flg] != nil
        #    #@join.update_attribute(:attend_flg, params[:attend_flg])
        #    @join.update_attributes(join_params)
        #else
        #    if @join.sanka_flg == 1
        #        @join.sanka_flg = 0
        #    else
        #        @join.sanka_flg = 1
        #    end
        #    @join.save
        #end
        if params[:attend_flg] == nil
            if @join.sanka_flg == 1
                @join.sanka_flg = 0
            else
                @join.sanka_flg = 1
            end
            @join.save
        else
            @join.update_attributes(join_params)
        end
        redirect_to root_path
    end

    def show
    end

    private
        def join_params
            params.require(:join).permit(:user_id, :place_id, :attend_flg)
        end

end
