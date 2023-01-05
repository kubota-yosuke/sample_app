class ChatsController < ApplicationController
    def create
        @chat = current_user.chats.build(chat_params)
        if @chat.save
            redirect_to vehicle_path(@chat.vehicle) #成功メッセージを追記
        else
            redirect_to vehicle_path(@chat.vehicle) #失敗メッセージを追記
        end
    end

    private

    def chat_params
        params.require(:chat).permit(:body).merge(vehicle_id: params[:vehicle_id])
    end
end
