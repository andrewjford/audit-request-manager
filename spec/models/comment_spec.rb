require 'rails_helper'

RSpec.describe Comment, type: :model do

  before do
    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.create(:project)
    @request = FactoryGirl.create(:request)
    @comment = FactoryGirl.create(:comment)
  end

  it "is valid with content" do
    expect(@comment).to be_valid
  end

  it "is invalid without content" do
    comment = FactoryGirl.build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end
end
