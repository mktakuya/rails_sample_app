require 'spec_helper'

describe Comment do
  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }
  before do
    @micropost = user.microposts.build(content: "Lorem ipsum")
    @comment = Comment.new(micropost_id: @micropost.id,
                           user_id: another_user.id, content: "Comment.")
  end

  subject { @comment }
  
  it { should respond_to(:micropost_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @comment.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @comment.content = "b" * 141 }
    it { should_not be_valid }
  end
end
