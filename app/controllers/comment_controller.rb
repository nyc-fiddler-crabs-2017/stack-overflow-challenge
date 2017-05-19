get '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comments = @question.comments
  erb :'comments/index'
end

get '/questions/:question_id/comments/new' do

  @question = Question.find(params[:question_id])
  if request.xhr?
    erb :'comments/_new', layout: false
  else
    erb :'comments/new'
  end
end

post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.new(params[:comment])
  if @comment.save
    redirect "/questions/#{@question.id}/comments"
  else
    erb :'comments/new'
  end
end

# get '/questions/:question_id/comments/:id' do
#   @question = Question.find(params[:question_id])
#   @comment = @question.comments.find(params[:id])
#   erb :'comments/show'
# end

get '/questions/:question_id/comments/:id/edit' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.find(params[:id])
  erb :'comments/edit'
end

put '/questions/:question_id/comments/:id' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.find(params[:id])
  if @comment.update_attributes(params[:comment])
    redirect "/questions/#{@question.id}/comments"
  else
    erb :'comments/edit'
  end
end

delete '/questions/:question_id/comments/:id' do
  @question = Question.find(params[:question_id])
  @comment = @question.comments.find(params[:id])
  @comment.destroy
  redirect "/questions/#{@question.id}/comments"
end
