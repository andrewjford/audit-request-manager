require 'rails_helper'

RSpec.describe "CommentsApis", type: :request do

  before do
    @user = FactoryGirl.create(:user)
    @project = FactoryGirl.create(:project)
    @request = FactoryGirl.create(:request)

    sign_in @user
  end

  it "creates a comment" do
    # comment_attributes = FactoryGirl.attributes_for(:comment)
    comment_attributes = {comment: {content: "I am the walrus", user_id: @user.id,
      project_id: @project.id, request_id: @request.id}}
    post "/projects/#{@project.id}/requests/#{@request.id}/comments/", params: comment_attributes.to_json, headers: {'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'}
    expect(response).to have_http_status(201)
  end

  it "shows a comment" do
    @comment = FactoryGirl.create(:comment)
    
    get "/projects/#{@project.id}/requests/#{@request.id}/comments/#{@comment.id}.json"
    json = JSON.parse(response.body)

    expect(response).to have_http_status(200)
    expect(json["data"]["attributes"]["content"]).to include("walrus")
  end

end
