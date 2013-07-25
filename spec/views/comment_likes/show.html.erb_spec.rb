require 'spec_helper'

describe "comment_likes/show" do
  before(:each) do
    @comment_like = assign(:comment_like, stub_model(CommentLike,
      :comment_id => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
