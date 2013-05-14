require 'spec_helper'

describe Course do

  it "has a name" do
    course = Course.new(:name => "WDI")
    expect(course.name).to eq "WDI"
  end

end