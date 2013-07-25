class CommentsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :edit, :update, :destroy, :index]
	before_filter :correct_user, only: [:destroy, :update, :edit] 

	def show #show specific image...
		@user = current_user
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def create
		@user = current_user
		#@gallery = Gallery.find(params[:id])
		@comment = current_user.comments.build(params[:comment])
		respond_to do |format|
			if @comment.save
				format.html {
					flash[:success] = "comment saved!"
					redirect_to :back }
				format.js
			else
				format.html {
					redirect_to :back }
				format.js
			end
		end
	end

	def edit
		#@comments = current_user.comments
	end

	def index#all current users images, is this useful??? will have edit/delete for each so I guess so
		@user = current_user
		@pics = @user.comments.paginate(page: params[:page])
	end

	def update
		if @comment.update_attributes(params[:comment])
	      flash[:success] = "comment updated"
	      redirect_to :back
	    else
	      render 'edit'
	    end
	end

	def destroy
		#@comment = Comment.find(params[:id])
		#if @comment.destroy
		#	render :json => @comment, :status => :ok
		#else
		#	render :js => "alert('error deleting comment');" #cahnge this
		#end

		@comment = Comment.find(params[:id])
		respond_to do |format|
			if @comment.destroy
				format.html {
					flash[:success] = "comment deleted!"
					redirect_to :back }
				format.js
			else
				format.html {
					redirect_to :back }
				format.js
				end
			end
	end

	

	private

		def correct_user
			@comment = current_user.comments.find_by_id(params[:id])
			redirect_to root_url if @comment.nil?
		end

end