class Api::V1::LinksController < ApplicationController


  def create
    @link = current_user.links.new link_params
    if @link.save
      render json: @link, status: 201
    else
      flash.now['alert-danger'] = @link.errors.full_messages.join(', ')
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    @link = Link.find params[:id]
    @link.assign_attributes link_params
    just_read = @link.read_changed? && @link.read
    if @link.save
      Read.create(link: @link) if just_read
      HotReads.new(@link)
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def destroy
    @link = Link.find params[:id]
    if @link.delete
      render json: @link, status: 202
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

  def link_params
    params.permit(:title, :url, :read)
  end
end
