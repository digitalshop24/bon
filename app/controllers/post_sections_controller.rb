class PostSectionsController < ApplicationController
  before_action :fetch_category
  before_action :fetch_post
  before_action :fetch_post_section, only: [:edit, :update, :destroy]

  def new
    @post_section = @post.post_sections.build
  end

  def edit
  end

  def create
    @post_section = @post.post_sections.build(@post_section_params)
    @post_section.save
  end

  def update
    @post_section.assign_attributes(ad_params)
    @post_section.save
  end

  def destroy
    @post_section.destroy
  end

  private

  def fetch_post_section
    @post_section = @post.post_sections.find(params[:id])
  end

  def fetch_post
    @post = @campaign.ad_units.find(params[:ad_unit_id])
  end

  def fetch_campaign
    @campaign = current_user.campaigns.find(params[:campaign_id])
  end

  def ad_params
    params.require(:ad).permit(
        :x, :y, :width, :height,
        :title,
        :image,
        :remote_image_url,
        :image_cache,
        :destination_url,
        :description,
        :has_description
    )
  end
end
