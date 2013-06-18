class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @pic = current_user.pics.build(params[:pic])
      @galleries = current_user.galleries
    	@gallery = current_user.galleries.build if signed_in?
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
