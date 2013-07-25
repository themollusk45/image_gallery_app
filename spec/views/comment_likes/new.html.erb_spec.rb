require 'spec_helper'

describe "comment_likes/new" do
  before(:each) do
    assign(:comment_like, stub_model(CommentLike,
      :comment_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new comment_like form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comment_likes_path, :method => "post" do
      assert_select "input#comment_like_comment_id", :name => "comment_like[comment_id]"
      assert_select "input#comment_like_user_id", :name => "comment_like[user_id]"
    end
  end
end
