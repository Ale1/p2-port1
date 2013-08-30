#show all notes

get '/' do
  redirect '/posts'
end

get '/posts' do
  @posts = Note.all.sort
  erb :index
end


get '/posts/new' do
erb :new  
end

post '/posts/new' do
  puts params.inspect
  Note.create!(title:params[:my_title],content:params[:my_content])
  redirect '/posts'
end

get '/posts/edit' do
  @post_id = params[:post_id]
  @my_post = Note.find(@post_id)
  erb :edit
end

post '/posts/edit' do
  if params[:my_field] == 'title' 
    Note.update(params[:post_id],title:params[:replacement])
    else Note.update(params[:post_id],content:params[:replacement])
  end
  redirect '/posts'
end

get '/posts/delete' do
  @post_id = params[:post_id]
  @my_post = Note.find(@post_id) 
  erb :delete
end

post '/posts/delete/:id' do
  Note.find(params[:id]).destroy
  redirect '/posts'
end
