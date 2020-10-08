class BetweensController < ApplicationController
    def index
        @betweens = Between.all
        render json: @betweens
    end

    def show
        @between = Between.find_by(id:params[:id])
        render json: @between
    end
    def create
        between = Between.create!(between_params)
        render json: between
    end
    
    private

    def between_params
        params.require(:between).permit(:playlist_id, :user_id)
    end
end
