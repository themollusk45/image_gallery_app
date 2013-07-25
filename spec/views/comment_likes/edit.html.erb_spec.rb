require 'spec_helper'

describe "comment_likes/edit" do
  before(:each) do
    @comment_like = assign(:comment_like, stub_model(CommentLike,
      :comment_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit comment_like form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comment_likes_path(@comment_like), :method => "post" do
      assert_select "input#comment_like_comment_id", :name => "comment_like[comment_id]"
      assert_select "input#comment_like_user_id", :name => "comment_like[user_id]"
    end
  end
end
