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
        @album = Album.find(params[:id])
    end

    def update 
        @album = Album.find(params[:id])
        if @album.update(album_params)
            redirect_to album_url(@album.id)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end

    def show
        @album = Album.find(params[:id])
    end

    def destroy
        @album = Album.find(params[:id])
        @band = @album.band
        @album.destroy
        redirect_to band_url(@band.id)
    end

    private

    def album_params
        params.require(:album).permit(:title, :year, :band_id, :live)
    end
end