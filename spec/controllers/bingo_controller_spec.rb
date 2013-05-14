require 'spec_helper'

describe BingoController do

  describe "index" do

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq 200
    end

  end

end