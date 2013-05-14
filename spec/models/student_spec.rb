require  'spec_helper'

describe Student do

  it "has a name" do
    student = Student.new(:name => "Erik")
    expect(student.name).to eq "Erik"
  end

  it "has a course" do
    course = Course.create(:name => "WDI")
    student = Student.new(:course_id => course.id)
    expect(student.course).to eq course
  end

end