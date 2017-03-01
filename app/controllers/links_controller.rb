class LinksController < ApplicationController
  def index
    @links = current_user.links.sort if current_user
  end
end
