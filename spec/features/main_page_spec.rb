require 'spec_helper'

describe "main page" do

  it "displays the title of the page" do
    visit '/'
    expect(page).to have_selector('h1', :text => "Welcome to Bingo!")
  end

  it "has a pull down menu that includes the names of each course" do
    course1 = Course.create(:name => "WDI SF")
    course2 = Course.create(:name => "WDI NY")
    visit '/'
    expect(page).to have_selector('form#bingo select#courses')
    expect(page).to have_selector('form#bingo select#courses option', :text => "WDI SF")
    expect(page).to have_selector('form#bingo select#courses option', :text => "WDI NY")
  end

  it "has a submit button" do
    visit '/'
    expect(page).to have_selector('form#bingo button')
  end

  it "chooses a random student" do
    course1 = Course.create(:name => "WDI SF")
    course2 = Course.create(:name => "WDI NY")
    student1 = Student.create(:name => "Jon Lai", :course_id => course1.id)
    student2 = Student.create(:name => "Jeff Kao", :course_id => course1.id)
    student3 = Student.create(:name => "Bryan Chang", :course_id => course2.id)
    visit '/'
    within('#bingo') do
      select('WDI NY')
    end
    click_button 'Choose random student'
    expect(page).to have_selector('h1#winner', :text => "Bryan Chang")
  end

end