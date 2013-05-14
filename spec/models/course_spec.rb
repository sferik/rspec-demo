require 'spec_helper'

describe Course do

  it "has a name" do
    course = Course.new(:name => "WDI")
    expect(course.name).to eq "WDI"
  end

  it "has many students" do
    course = Course.create(:name => "WDI")
    student1 = Student.create(:course_id => course.id)
    student2 = Student.create(:course_id => course.id)
    expect(course.students).to be_an Array
    expect(course.students.size).to eq 2
    expect(course.students).to include student1
    expect(course.students).to include student2
  end

end