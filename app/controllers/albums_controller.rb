class AlbumsController < ApplicationController
    def new
        @band = Band.find(params[:band_id])
        @album = Album.new(band_id: params[:band_id])
    end

    def create
        @album = Album.new(album_params)
        if @album.save
             redirect_to album_url(@album.id)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update 
    end

    def show
        @album = Album.find(params[:id])
    end

    def destroy
    end

    private

    def album_params
        params.require(:album).permit(:title, :year, :band_id, :live)
    end
end