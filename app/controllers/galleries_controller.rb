class GalleriesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :edit, :update, :destroy]
	before_filter :correct_user, only: [:destroy, :update, :edit] 

	def show #show specific gallery...
		@user = current_user
		@single_gallery = Gallery.find(params[:id])
	end

	def new
		@gallery = Gallery.new
	end

	def create
		@gallery = current_user.galleries.build(params[:gallery])
		if @gallery.save
			flash[:success] = "Gallery created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def edit
	end

	def index
		@galleries = Gallery.paginate(page: params[:page])
	end

	def update
		if @gallery.update_attributes(params[:gallery])
	      flash[:success] = "Profile updated"
	      #sign_in @user
	      redirect_to @gallery
	    else
	      render 'edit'
	    end
	end

	def destroy
		@gallery.destroy
		redirect_to root_url
	end

	

	private

		def correct_user
			@gallery = current_user.galleries.find_by_id(params[:id])
			redirect_to root_url if @gallery.nil?
		end

end