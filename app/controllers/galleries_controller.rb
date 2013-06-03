class GalleriesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]#add the other restricted actions when doing the B part
	before_filter :correct_user, only: :destroy #add others in part B

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