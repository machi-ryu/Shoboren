class ApplicationController < ActionController::Base

    def after_sign_out_path_for(resourse)
        new_user_session_path
    end

end
