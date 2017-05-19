get '/answers' do
  "This is the answers route"
end

get '/questions/:question_id/answers/new' do
  require_user
  @question = Question.find(params[:question_id])
  erb :'/answers/new'
end

post '/questions/:question_id/answers' do
  require_user
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(params[:answer])
  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :'/answers/new'
  end
end


get '/questions/:question_id/answers/:answer_id/edit' do
  require_user
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:answer_id])
  erb :'/answers/edit'
end

put '/questions/:question_id/answers/:answer_id' do
  require_user
  @question = Question.find_by(id: params[:question_id])
  @answer = Answer.find_by(id: params[:answer_id])
  if @answer.update(body: params[:body])
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors
    erb :'/answers/edit'
  end

end

delete 'questions/:question_id/answers/:answer_id' do
  require_user
  @question = Question.find_by(id: params[:question_id])
  @answer   = Answer.find_by(id: params[:answer_id])
  Answer.find_by(id: params[:answer_id]).destroy
  redirect "/questions/#{@question.id}"
end
