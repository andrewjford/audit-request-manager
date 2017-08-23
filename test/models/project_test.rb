require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save project without title" do
    project = Project.new
    assert_not project.save, "Saved the project without a title"
  end

  test "should not save project if duplicate title" do
    project1 = Project.new(title: "State 1")
    project2 = Project.new(title: "State 1")
    project1.save
    assert_not project2.save, "Saved project with duplicate name"
  end
end
