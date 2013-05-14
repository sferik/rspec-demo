class BingoController < ApplicationController

  def index
    @courses = Course.all
    render 'main_page'
  end

  def choose_student
    if params[:course]
      course = Course.find(params[:course][:id])
      @winner = course.students.sample
      render 'choose_winner'
    else
      head :status => 404
    end
  end

end
