require_relative '../spec_helper'

describe Student do

  it "has a name" do
    student = Student.new(:name => "Erik")
    expect(student.name).to eq "Erik"
  end

end