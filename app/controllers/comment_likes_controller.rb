class CommentLikesController < ApplicationController
 

  # GET /comment_likes/new
  # GET /comment_likes/new.json
  def new
    @comment_like = CommentLike.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render xml: @comment_like }
    end
  end

   # POST /comment_likes
  # POST /comment_likes.json
  def create
    @comment_like = CommentLike.new(params[:comment_like])
    comment = params[:comment_like][:comment_id]
    uid = params[:comment_like][:user_id]
    @extant = CommentLike.find(:last, :conditions => ["comment_id = ? AND user_id = ?", comment, uid])

    if( @extant.blank?)
      respond_to do |format|
        if @comment_like.save
          format.js
          format.html { redirect_to :back }
        else
          format.html { redirect_to comments_path }#... not right
          format.xml { render :xml => @comment_vote.errors, :status => :unprocessable_entity }
        end
      end
    else
      render :js => "alert('You already liked this fool');"#hnot really needed, need to change like to unlike etc
    end
  end
end
