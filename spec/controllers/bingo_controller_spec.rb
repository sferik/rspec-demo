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

end