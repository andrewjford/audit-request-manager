require 'rails_helper'

RSpec.describe Comment, type: :model do

  before do
    @user = User.create(
      email: "a@a.a",
      name: "Abe",
      password: "asdfasdf",
      organization: Organization.new(name: "testCorp")
    )
    @project = Project.create(title: "The Big Jambroni")
    @request = @project.requests.create(
    title: "Give us the money Lebowski",
    description: "Where's the money Lebowski",
    user_id: @user.id,
    request_number: 1
    )
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
