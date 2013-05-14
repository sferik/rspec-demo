class BingoController < ApplicationController

  def index
    @courses = Course.all
    render 'main_page'
  end

end
