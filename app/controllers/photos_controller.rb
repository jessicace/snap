class PhotosController < ApplicationController
  before_action :find_album
  before_action :find_photo, except: [ :index, :new, :create ]

  def index
    @photos = @album.photos
  end

  def show
  end

  def edit
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = @album.photos.build(photo_params)
    if @photo.save
      redirect_to album_path(@album), notice: 'Added new photo.'
    else
      render :new, notice: 'Validation failed.'
    end
  end

  def update
    if @photo.update_attributes(photo_params)
      redirect_to album_path(@album), notice: 'Updated photo details.'
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to album_path(@album)
  end

  private
  def photo_params
    params.require(:photo).permit(:description, :image, :remove_image, :remote_image_url)
  end
  
  def find_album
    @album = Album.friendly.find(params[:album_id])
  end

  def find_photo
    @photo = @album.photos.find(params[:id])
  end
  
end
