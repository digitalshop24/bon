class LinksController < ApplicationController
  before_action :set_link, only: [:destroy, :update]

  def create
    @link = Link.create(link_params)
  end

  def update
    @link.update(link_params)
  end

  def destroy
    @link.destroy
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:text, :url, :position)
  end
end
