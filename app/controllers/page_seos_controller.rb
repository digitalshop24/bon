class PageSeosController < ApplicationController
  def update
    page_seo = PageSeo.find(params[:id])
    page_seo.update(page_seo_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def page_seo_params
    params.require(:page_seo).permit(:title, :description)
  end
end
