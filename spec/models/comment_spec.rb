require 'spec_helper'

describe Comment do

	let(:user) { FactoryGirl.create(:user) }
	let(:gallery) { FactoryGirl.create(:gallery) }
	let(:pic) { FactoryGirl.create(:pic) }
	#let(:comment) { FactoryGirl.create(:comment) } #need to do the factory and such before this will work...
	before { @comment = user.comments.build(content: "stupid comment" gallery_id: gallery.id) }  #user id is always there, gallery id is there if its a gallery comment, likewise for picid...

	subject { @comment }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:gallery_id) }
	it { should respond_to(:pic_id) }
	it { should respond_to(:parent_id) }
	it { should respond_to(:loves) }
	it { should respond_to(:hates) }
	it { should respond_to(:rating) }

	describe "when user_id is not present" do
		before { @comment.user_id = nil }
		it { should_not be_valid }
	end

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Comment.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end

		it "should not allow access to gallery_id" do
			expect do
				Comment.new(gallery_id: gallery.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end

		it "should not allow access to pic_id" do
			expect do
				Comment.new(pic_id: pic.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end

		#it "should not allow access to parent_id" do  #need to do other stuff before this will work
		#	expect do
		#		Comment.new(parent_id: comment.id)
		#	end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		#end
	end
end
