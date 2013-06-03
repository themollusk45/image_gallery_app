class StaticPagesController < ApplicationController
  def home
    if signed_in?
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
