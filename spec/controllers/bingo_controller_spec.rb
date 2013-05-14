require 'spec_helper'

describe BingoController do

  describe "index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it "renders the main_page template" do
      get :index
      expect(response).to render_template("main_page")
    end

    it "loads all of the courses into @courses" do
      course1 = Course.create(:name => "WDI SF")
      course2 = Course.create(:name => "WDI NY")
      get :index
      expect(assigns(:courses).size).to eq 2
      expect(assigns(:courses)).to include course1
      expect(assigns(:courses)).to include course2
    end

  end

  describe "choose_student" do

    context "with a valid course id passed" do

      it "responds sucessfully with an HTTP 200 status code" do
        course = Course.create
        get :choose_student, :course => {:id => course.id}
        expect(response).to be_success
        expect(response.status).to eq 200
      end

      it "renders the choose_winner template" do
        course = Course.create
        get :choose_student, :course => {:id => course.id}
        expect(response).to render_template("choose_winner")
      end

      it "chooses a student in the course as a @winner" do
        course = Course.create
        student = Student.create(:course_id => course.id)
        get :choose_student, :course => {:id => course.id}
        expect(assigns(:winner)).to eq student
      end

    end

    context "without a valid course id passed" do
      it "responds sucessfully with an HTTP 200 status code" do
        get :choose_student
        expect(response).to be_not_found
        expect(response.status).to eq 404
      end
    end

  end

end