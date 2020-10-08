class PlaylistsController < ApplicationController
    def index
        @playlists = Playlist.all 
        render json: @playlists, include: :songs
    end

    def show
        @playlist = Playlist.find_by(id:params[:id])
        render json: @playlist, include: :songs
    end

    def destroy 
        playlist = Playlist.find_by(id: params[:id])
        playlist.destroy
    end 

    def create
        playlist = Playlist.create!(playlist_item_params)
        render json: playlist, include: :songs
    end

    private

    def playlist_item_params
        params.require(:playlist).permit(:name)
    end
end
