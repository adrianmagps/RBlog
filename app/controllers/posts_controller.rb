class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]
  before_action :set_categ_tags, only: [:edit, :new]
  before_action :set_widgets, only: [:index, :by_category, :by_date, :by_tag]
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

  def new
    authorize! :create, Post
    @post = Post.new
  end

  def create
    authorize! :create, Post

    @post = Post.create(post_params)
    @post.summary = Nokogiri::HTML.parse(@post.content).css('p').first.text
    @post.user = current_user
    @post.categories << Category.find(params[:categories]) unless params[:categories].nil?
    @post.tags << Tag.find(params[:tags]) unless params[:tags].nil?

    if @post.save
      flash[:notice] = 'Create post successful'
      redirect_to @post
    else
      @categories = Category.all.only(:id, :name)
      @tags = Tag.all.only(:id, :name)
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    render json: params
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to posts_path
  end

  def by_category
    @posts = Category.find(params[:id]).posts
    render 'by'
  end

  def by_tag
    @posts = Tag.find(params[:id]).posts
    render 'by'
  end

  def by_date
    @posts = Post.where("DATE_PART('month', created_at) = ? and DATE_PART('year',created_at) = ?", params[:month], params[:year])
    render 'by'
  end

  def archives
    @posts = Post.all.select(:id, :created_at).order(created_at: :desc)
    @post_months = @posts.group_by { |t| t.created_at.beginning_of_month.to_date  }
    render json: @post_months
  end

  # def recents
  #   @posts = Post.all.order(created_at: :desc).limit(3)
  #   render json: @posts, include: :categories
  # end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def set_categ_tags
     @categories = Category.all.only(:id, :name)
     @tags = Tag.all.only(:id, :name)
    end

    def set_widgets
      @recents = Post.all.order(created_at: :desc).limit(3)
    end

    def update_visits_count
      @post.visits = @post.visits += 1
      @post.save
    end

    def post_params
      params.require(:post).permit(:title, :content, :visible)
    end
end
