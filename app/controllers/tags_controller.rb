class TagsController < ApplicationController
  def index
    @tags = Tag.joins(:posts).group(:tag_id, :name).count
    respond_to do |format|
      format.html
      format.json { render json: @tags }
    end
  end
end
