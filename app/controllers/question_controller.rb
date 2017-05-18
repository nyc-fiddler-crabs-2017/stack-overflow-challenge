get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  require_user
  @question = Question.new(body: params[:body], user_id: current_user.id)
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.error.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end


get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
end


put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:entry])

  if @question.save
    redirect "questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/questions'
end
