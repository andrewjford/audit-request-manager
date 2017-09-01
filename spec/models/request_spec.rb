require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @user = User.create(
      email: "a@a.a",
      name: "Abe",
      password: "asdfasdf",
      organization: Organization.new
    )
    @project = Project.create(title: "The Big Jambroni")
    @request = @project.requests.create(
    title: "Give us the money Lebowski",
    description: "Where's the money Lebowski",
    user_id: @user.id,
    request_number: 1
    )
  end

  it "is invalid without a title" do
    request = Request.new(
    title: nil,
    description: "this song has no name"
    )
    request.valid?
    expect(request.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a description" do
    request = Request.new(
    title: "The Great Request",
    description: nil
    )
    request.valid?
    expect(request.errors[:description]).to include("can't be blank")
  end

  it "is invalid without a user" do
    request = Request.new(
    title: "The Great Request",
    description: nil
    )
    request.valid?
    expect(request.errors[:description]).to include("can't be blank")
  end

  it "is valid with title and description" do
    expect(@request).to be_valid
  end

  it "properly increases project's request count" do
    expect(@project.request_counter).to eq 2
  end
end
