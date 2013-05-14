class BingoController < ApplicationController

  def index
    @courses = Course.all
    render 'main_page'
  end

  def choose_student
    course = Course.find(params[:course][:id])
    @winner = course.students.sample
    render 'choose_winner'
  end

end
