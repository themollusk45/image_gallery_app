require 'spec_helper'

describe "Static pages" do 

	describe "Home page" do

		it "should have content 'Mugen gallery'" do
			visit '/static_pages/home'
			page.should have_selector('h1', 
								:text => "Mugen gallery")
		end

		it "should have the base title" do
			visit '/static_pages/home'
			page.should have_selector('title',
								:text => "Mugen Gallery")
		end

		it "should have the custom title" do
			visit '/static_pages/home'
			page.should have_selector('title',
								:text => '| Home')
		end


	end

	describe "Help page" do

		it "should have content 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('h1', 
								:text => "Help")
		end

		it "should have the base title" do
			visit '/static_pages/home'
			page.should have_selector('title',
								:text => "Mugen Gallery")
		end

		it "should have the right title" do
			visit '/static_pages/help'
			page.should have_selector('title',
								:text => ' | Help')
		end
	end

	describe "About page" do

		it "should have content 'About'" do
			visit '/static_pages/about'
			page.should have_selector('h1', 
								:text => "About")
		end


		it "should have the base title" do
			visit '/static_pages/home'
			page.should have_selector('title',
								:text => "Mugen Gallery")
		end

		it "should have the custom title" do
			visit '/static_pages/about'
			page.should have_selector('title',
								:text => ' | About')
		end
	end

		describe "Contact page" do

		it "should have content 'Contact'" do
			visit '/static_pages/contact'
			page.should have_selector('h1', 
								:text => "Contact")
		end


		it "should have the base title" do
			visit '/static_pages/home'
			page.should have_selector('title',
								:text => "Mugen Gallery")
		end

		it "should have the custom title" do
			visit '/static_pages/contact'
			page.should have_selector('title',
								:text => ' | Contact')
		end
	end
end

