class ApplicationController < ActionController::Base
    include SessionsHelper

    private

        def logeged_in_user
            unless logged_in?
                flash[:danger] = "Porfavor ingresa."
                redirect_to login_url
            end
        end
end
