require 'spec_helper'

describe "GalleryPages" do
 
 	subject { page }

 	let(:user) { FactoryGirl.create(:user) }
 	before { sign_in user }

 	describe "gallery creation" do
 		before { visit root_path }

 		describe "with invalid information" do

 			it "should not create a gallery" do
 				expect { click_button "Create gallery" }.not_to change(Gallery, :count)
 			end

 			describe "error messages" do
 				before { click_button "Create gallery" }
 				it { should have_content('error') }
 			end
 		end

 		describe "with valid information" do

 			before do  
 				fill_in 'gallery_title', with: "Lorem ipsum" 
 				fill_in 'gallery_description', with: "Lorem ipsum dipsum squab" 
 			end

 			it "should create a gallery" do
 				expect { click_button "Create gallery" }.to change(Gallery, :count).by(1)
 			end
 		end
 	end

 	describe "gallery destruction" do
 		before { FactoryGirl.create(:gallery, user: user) }

 		describe "as correct user" do
 			before { visit root_path }

	 		it "should delete a gallery" do
	 			expect { click_link "delete" }.to change(Gallery, :count).by(-1)
	 		end
	 	end
 	end
end
