require 'spec_helper'

describe Gallery do

	let(:user) { FactoryGirl.create(:user) }
	before { @gallery = user.galleries.build(title: "agalleryomg", description: "Lorem ipsum") }
	

	subject { @gallery }

	it { should respond_to(:title) }
	it { should respond_to(:description) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	it { should respond_to(:pics) }
	its(:user) { should == user }
	#it { should respond_to(:images) }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @gallery.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank title" do
		before { @gallery.title = " " }
		it { should_not be_valid }
	end

	describe "with title that is too long" do
		before { @gallery.title = "a" * 101 }
		it { should_not be_valid }
	end

	describe "with description that is too long" do
		before { @gallery.description = "a" * 1001 }
		it { should_not be_valid }
	end

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Gallery.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end
end
