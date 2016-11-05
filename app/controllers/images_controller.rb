class ImagesController < ApplicationController
  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @image.update_attributes(image_params)
    redirect_to @image.imageable
  end

  def image_params
    params.require(:image).permit(:crop_x, :crop_y, :crop_w, :crop_h)
  end
end
