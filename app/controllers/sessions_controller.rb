class SessionsController < ApplicationController
    def create
        member = Member.find_by(name: params[:name])
        if member&.authenticate(params[:password])
            session[:member_id] = member.id
            redirect_to controller: :accounts, action: :show
        else
            flash.alert = "名前とパスワードが一致しません。"
        end
    end

    def destroy
        session.delete(:member_id)
        redirect_to :root
    end
end
