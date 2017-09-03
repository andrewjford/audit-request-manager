require 'rails_helper'

RSpec.describe Comment, type: :model do

  before do
    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.create(:project)
    @request = FactoryGirl.create(:request)
    @comment = Comment.new(
      content: "howdy",
      user_id: @user.id,
      project_id: @project.id,
      request_id: @request.id
    )
  end

  it "is valid with content" do
    expect(@comment).to be_valid
  end

  it "is invalid without content" do
    comment = Comment.new(
      content: nil,
      user_id: @user.id,
      project_id: @project.id,
      request_id: @request.id
    )
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end
end
