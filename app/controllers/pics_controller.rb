class PicsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :edit, :update, :destroy, :index]
	before_filter :correct_user, only: [:destroy, :update, :edit] 

	def show #show specific image...
		@user = current_user
		@pic = Pic.find(params[:id])
	end

	def new
		@pic = Pic.new
	end

	def create
		@user = current_user
		@pic = current_user.pics.build(params[:pic])
		
		if @pic.save
			flash[:success] = "Image saved!"
			redirect_to @pic
		else
			#@feed_items = []
			render :action => "new"#should go back to upload pics page...
		end
	end

	def edit
	end

	def index#all current users images, is this useful??? will have edit/delete for each so I guess so
		@user = current_user
		#@galleries = Gallery.paginate(page: params[:page])#don't really want this...
		@pics = @user.pics.paginate(page: params[:page])
	end

	def update
		@pic = Pic.find(params[:id])

		if @pic.update_attributes(params[:image])
	      flash[:success] = "Image updated"
	      redirect_to @pic
	    else
	      render 'edit'
	    end
	end

	def destroy
		@pic.destroy
		redirect_to root_url
	end

	

	private

		def correct_user
			@pic = current_user.pics.find_by_id(params[:id])
			redirect_to root_url if @pic.nil?
		end

end