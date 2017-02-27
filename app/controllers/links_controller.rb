class LinksController < ApplicationController
  def index
    @hot_links = Link.hot
    @links = current_user.links if current_user
  end
end
