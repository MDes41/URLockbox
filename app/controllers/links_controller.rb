class LinksController < ApplicationController
  def index
    @hot_links = Link.hot
    @links = current_user.links if current_user
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update_attributes(link_params)
    redirect_to links_path
  end

  private
    def link_params
      params.require(:link).permit(:url, :title)
    end
end
