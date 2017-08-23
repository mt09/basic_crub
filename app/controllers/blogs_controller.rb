class BlogsController < ApplicationController
  def index
    @blog = Blog.all
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

  private
    def params_blog
      params.require(:blog).permit(:title, :content)
    end
end
