class GalleriesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :edit, :update, :destroy]
	before_filter :correct_user, only: [:destroy, :update, :edit] 

	def show #show specific gallery...
		@user = current_user
		if signed_in?
			@pic = current_user.pics.build(params[:pic]) 
			@comment = @user.comments.build(params[:comment])
		end
		@gallery = Gallery.find(params[:id])
		@galleries = @user.galleries
		@pics = @gallery.pics
		@comments = @gallery.comments.paginate(page: params[:page], :per_page =>  10)
	end

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = current_user.galleries.build(params[:gallery])
		#@galleries = current_user.galleries.all
		respond_to do |format|
			if @gallery.save
				format.html {flash[:success] = "Gallery created!"
					redirect_to root_url }
				format.js
			else
				format.html { @feed_items = []
					render 'static_pages/home' }
				format.js
			end
		end
	end

	def edit
	end

	def index
		@user = current_user
		@galleries = @user.galleries.paginate(page: params[:page])
	end

	def update
		if @gallery.update_attributes(params[:gallery])
	      flash[:success] = "Gallery updated"
	      redirect_to @gallery
	    else
	      render 'edit'
	    end
	end

	def destroy
		@gallery = Gallery.find(params[:id])
		if @gallery.destroy
			render :json => @gallery, :status => :ok
		else
			render :js => "alert('error deleting gallery');"
		end
	end

	private

		def correct_user
			@gallery = current_user.galleries.find_by_id(params[:id])
			redirect_to root_url if @gallery.nil?
		end

end