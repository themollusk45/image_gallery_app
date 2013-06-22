class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @pic = current_user.pics.build(params[:pic])
      @galleries = current_user.galleries.paginate(page: params[:page])
    	@gallery = current_user.galleries.build
    	@feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
