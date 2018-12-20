class TracksController < ApplicationController
    def new
        @album = Album.find(params[:album_id])
        @band = Band.find(@album.band_id)
        @tracks = Track.new
    end

    def create
        @track = Track.new(track_params)
        if @track.save
            redirect_to album_url(@track.album_id)
        else
            flash[:errors] = @track.errors.full_messages
            redirect_to album_url(@track.album_id)
        end
    end

    def show
        @track = Track.find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def track_params
        params.require(:track).permit(:title, :ord, :lyrics, :band_id, :album_id, :bonus)
    end

end