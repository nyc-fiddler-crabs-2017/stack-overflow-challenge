get '/answers' do
  "This is the answers route"
end

get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  if request.xhr?
    erb :'/answers/_new', layout: false, locals: {question: @question}
  else
    erb :'/answers/new'
  end
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(params[:answer])
  if @answer.save
    if request.xhr?
      erb :'/answers/_show', layout: false, locals: {partial_a: @answer }
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = @answer.errors.full_messages
    erb :'/answers/new'
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

delete 'questions/:question_id/answers/:answer_id' do
  @question = Question.find_by(id: params[:question_id])
  @answer   = Answer.find_by(id: params[:answer_id])

  Answer.find_by(id: params[:answer_id]).destroy

  redirect "/questions/#{@question.id}"
end
