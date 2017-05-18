get '/answers' do
  "This is the answers route"
end

get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/answers/new'
end

post '/questions/:id/answers' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new(body: params[:body], question_id: params[:id], user_id: @question.user.id)

  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
  end
end
