require 'spec_helper'

describe ProjectPolicy do
  subject { ProjectPolicy }

  permissions :new?, :create? do
    it "denies access if not manager/admin" do
      expect(subject).not_to permit(User.new(role: 2), Project.new())
      expect(subject).not_to permit(User.new(role: 3), Project.new())
    end

    it "grants access if user is a manager" do
      expect(subject).to permit(FactoryGirl.create(:user), Project.new())
    end
  end

  permissions :show? do
    it "denies access if not assigned to project" do
      expect(subject).not_to permit(User.new(role: 1), Project.new())
      expect(subject).not_to permit(User.new(role: 2), Project.new())
      expect(subject).not_to permit(User.new(role: 3), Project.new())
    end

    it "grants access if user is assigned" do
      @user = FactoryGirl.create(:user)

      expect(subject).to permit(@user,
        Project.create(title: "Test1", user_ids: [@user.id]))
    end
  end

  permissions :edit?, :update? do
    it "denies access if not admin or assigned manager" do
      expect(subject).not_to permit(User.new(role: 2), Project.new())
      expect(subject).not_to permit(User.new(role: 3), Project.new())
    end

    it "grants access if user is an assigned manager" do
      @user = FactoryGirl.create(:user)

      expect(subject).to permit(@user,
        Project.create(title: "Test1", user_ids: [@user.id]))
    end
  end

  permissions :destroy? do
    it "denies if not admin" do
      expect(subject).not_to permit(User.new(role: 1), Project.new())
      expect(subject).not_to permit(User.new(role: 2), Project.new())
      expect(subject).not_to permit(User.new(role: 3), Project.new())
    end

    it "grants access if admin" do
      @user = FactoryGirl.create(:user, role: 0)

      expect(subject).to permit(@user, Project.new())
    end
  end
end
