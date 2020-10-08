class SongsController < ApplicationController
    def index
        @songs = Song.all
        render json: @songs
    end

    def show
        @song = Song.find_by(id:params[:id])
        render json: @song
    end

    def destroy 
        song = Song.find_by(id: params[:id])
        song.destroy
    end 

    def create
        song = Song.create!(song_params)
        render json: song

    end
    
    private

    def song_params
        params.permit(:cover,:title,:artist,:preview)
    end
end
