class MainController < ApplicationController
    before_action :must_be_logged_in, only: %i[ user_Item ]

    def login
    end

    def create
        u = User.where(login: params[:login]).first
        if u && u.authenticate(params[:password])
            session[:logged_in] = true
            session[:user_id] = u.id
            redirect_to user_item_path
        else
            redirect_to main_login_path, notice: 'wrong login or password'
        end
    end

    def destroy
        reset_session
    end 

    def user_Item
        user_id = session[:user_id]
        user = User.find(user_id)
        @items = user.items
        session[:prev_page] = 'user_item_page'
    end
end
