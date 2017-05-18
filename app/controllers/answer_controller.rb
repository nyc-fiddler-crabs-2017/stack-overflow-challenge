get '/answers' do
  "This is the answers route"
end

get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/answers/new'
end

post '/questions/:id/answers' do
  "This is the /answers post route"
end
