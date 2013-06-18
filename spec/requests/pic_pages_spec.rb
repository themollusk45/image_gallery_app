require 'spec_helper'

describe "Pic pages" do 

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	let(:gallery) { FactoryGirl.create(:gallery) }
	before { sign_in user }

	describe "pic creation" do
		before { visit root_path }

		describe "with invalid information" do

			it "should not create a pic" do
				expect { click_button "upload image" }.not_to change(Pic, :count)
			end

			describe "error messages" do
				before { click_button "Post" }
				it { should have_content('error') }
			end
		end
		
		describe "with valid information" do

			before { fill_in 'pic_title', with: "lorem" }#not sure how to select a file here?
			it "should create a pic" do
				expect { click_button "upload image" }.to change(Pic, :count).by(1)
			end
		end
	end

	describe "pic destruction " do
		before { FactoryGirl.create(:pic, user: user, gallery: gallery) }

		describe "as correct user" do
			before { visit gallery_path(gallery) }

			it "should delete a micropost" do
				expect { click_link "delete" }.to change(Pic, :count).by(-1)
			end
		end
	end
end