class PageTextsController < ApplicationController
  def update
    @page_text = PageText.find(params[:id])
    @page_text.update(page_text_params)
  end

  private

  def page_text_params
    params.require(:page_text).permit(:content)
  end
end
