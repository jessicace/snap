class AlbumsController < ApplicationController

  before_action :find_album, except: [ :index, :new, :create ]

  def index
    @albums = Album.all
  end

  def show; end

  def edit; end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    if @album.save
      redirect_to album_path(@album), notice: 'Added new album.'
    else
      render :new
    end
  end

  def update
    if @album = Album.update_attributes(album_params)
      redirect_to album_path(@album), notice: 'Updated album.'
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path, notice: 'Deleted album.'
  end

  private
    
  def find_album
    @album = Album.friendly.find(params[:id])
  end
  
  def album_params
    params.require(:album).permit(:title)
  end
  
end
