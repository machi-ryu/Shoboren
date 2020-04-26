module My
    class My::EventsController < ApplicationController
        before_action :authenticate_user!

        def index
            @events = Place.joins(:joins).where(joins: { id: [current_user.joins]})
        end

    end
end
