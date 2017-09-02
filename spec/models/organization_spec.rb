require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "is valid with name" do
    org = Organization.new(name: "Test")
    expect(org).to be_valid
  end

  it "is invalid without a name" do
    organization = Organization.new()
    organization.valid?
    expect(organization.errors[:name]).to include("can't be blank")
  end

  it "is invalid if a duplicate name" do
    org1 = Organization.create(name: "Test")
    org2 = Organization.create(name: "Test")
    expect(org2.errors[:name]).to include("has already been taken")
  end
end
