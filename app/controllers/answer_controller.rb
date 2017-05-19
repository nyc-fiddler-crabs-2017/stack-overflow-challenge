get '/answers' do
  "This is the answers route"
end

get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/answers/new'
end

post '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.new(body: params[:body], question_id: params[:question_id], user_id: @question.user.id)

  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
  end
end

get '/questions/:question_id/answers/:answer_id/edit' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:answer_id])
  erb :'/answers/edit'
end

put '/questions/:question_id/answers/:answer_id' do
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:answer_id])
  if @answer.update(body: params[:body])
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors
    erb :'/answers/edit'
  end
end
