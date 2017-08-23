class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :show, :destroy]

  def index
    @blog = Blog.order("created_at desc")
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params_blog)

    if @blog.save
      redirect_to :blogs
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(params_blog)
      redirect_to :blogs
    else
      render :new
    end
  end

  def destroy
  @blog.destroy
  redirect_to :blogs
  end

  def show
  end

  private
    def params_blog
      params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
