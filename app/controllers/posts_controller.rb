class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :update_visits_count, only: [:show]
  def index
    @posts = Post.all.order(created_at: :desc)
    @recents = @posts.limit(3)
    @most_new = @posts.first

    respond_to do |format|
      format.html
      format.json { render json: @posts }
      format.atom
    end
  end

  def new
    authorize! :create, Post
    @post = Post.new
    @categories = Category.all
    @tags = Tag.all
  end

  def create
    authorize! :create, Post
    @post = Post.create(post_params)
    @post.summary = @post.content[0..100]
    @post.user = current_user
    render json: @post
    #redirect_to
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

  def recents
    @posts = Post.all.order(created_at: :desc).limit(3)
    render json: @posts, include: :categories
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

    def post_params
      params[:user] = current_user
      params.require(:post).permit(:title, :content, :visible, :user)
    end
end
