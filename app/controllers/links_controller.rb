class LinksController < ApplicationController
  def index
    @hot_links = Link.hot
    @links = current_user.links.sort if current_user
  end
end
