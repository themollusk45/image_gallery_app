require 'spec_helper'

describe Pic do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @pic = user.pics.build(title: "apic", description: "apicdesc") }

  subject { @pic }

  it { should respond_to(:title) }
  it { should respond_to(:description) }
  it { should respond_to (:gallery_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  describe "accessible attributes" do
  	it "should not allow access to user_id" do
  		expect do
  			Pic.new(user_id: user.id)
  		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  	end
  end

  describe "when user_id is not present" do
  	before { @pic.user_id = nil }
  	it { should_not be_valid }
  end

  describe "with title that is too long" do
  	before { @pic.title = "a" * 101 }
  	it { should_not be_valid }
  end

  describe "with description that is too long" do
  	before { @pic.description = "a" * 1001 }
  	it { should_not be_valid }
  end
end
