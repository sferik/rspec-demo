RspecDemo::Application.routes.draw do
  get '/' => "bingo#index"
  get '/you_win' => 'bingo#choose_student'
end
