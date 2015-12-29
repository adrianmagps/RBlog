class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index
    @categories = Category.all
    respond_to do |format|
      format.html
      format.json { render json: @categories, only: [:id, :name] }
    end
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
