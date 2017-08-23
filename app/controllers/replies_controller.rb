class RepliesController < ApplicationController
  before_action :set_blog, only: [:new, :create]

  def new
    @reply = @blog.replies.new
  end

  def create
    @reply = @blog.replies.new(params_reply)

    if @reply.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  private
  def params_reply
    params.require(:reply).permit(:reply)
  end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

end
