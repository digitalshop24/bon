class PageSeosController < ApplicationController
  def update
    page_seo = PageSeo.find(params[:id])
    page_seo.update(page_seo_params)
  end

  private

  def page_seo_params
    params.require(:page_seo).permit(:title, :description)
  end
end
