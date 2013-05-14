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

end