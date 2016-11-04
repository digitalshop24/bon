class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_categories
  before_action :check_admin

  private

  def set_categories
    @categories = Category.all
  end

  def check_admin
    @is_admin = current_user && current_user.has_role?(:admin)
  end
end
