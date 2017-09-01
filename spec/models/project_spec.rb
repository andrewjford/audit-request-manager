require 'rails_helper'

RSpec.describe Project, type: :model do
  before do
    @project = Project.new(title: "Crepe Factory 2016")
  end

  it "is invalid without a title" do
    project = Project.new(title: nil)
    project.valid?
    expect(project.errors[:title]).to include("can't be blank")
  end

  it "is valid with title" do
    expect(@project).to be_valid
  end

  it "properly increases request count" do
    @project.increase_request_count
    expect(@project.request_counter).to eq 2
  end

end
