class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :update_visits_count, only: [:show]
  def index
    @posts = Post.all.order(created_at: :desc)
    @most_new = @posts.first

    respond_to do |format|
      format.html
      format.json { render json: @posts }
      format.atom
    end
  end

  def show
  end

  def by_category
    @cat = Category.find(params[:id])
    render json: @cat, include: :posts
  end

  def archives
    @archives = Post.group('DATE(created_at)').count
    render json: @archives
  end

  def by_tag
    @tags = Tag.find(params[:id])
    render json: @tags, include: :posts
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def update_visits_count
      @post.visits = @post.visits += 1
      @post.save
    end
end
