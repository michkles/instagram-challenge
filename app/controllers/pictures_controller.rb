class PicturesController < ApplicationController

  def index
    @pictures = Picture.order('created_at')
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(photo_params)
    if @picture.save
      redirect_to pictures_path
    else
      'Error'
    end
  end

  private

  def photo_params
    params.require(:picture).permit(:image, :title)
  end


end
