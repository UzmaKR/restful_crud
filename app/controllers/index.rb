#Get all notes
get '/' do 
  erb :index
end

#Start creation process for note
get '/notes' do
  erb :note_form
end

# Creation: save to database, run validations
post '/notes' do
# p @note
  @note = Note.new(params[:notes])
  if @note.valid?
    @note.save
    redirect '/'
  else
    p @note.errors
    erb :note_form
  end
# redirects to see all notes
# can be used for updates?
end

#Edit
get '/notes/:id' do
  @note = Note.find(params[:id])
  erb :note_form
end

#Edit : save updates
# no validations
post '/notes/:id' do
  @note = Note.find(params[:id])
  @note.update_attributes(params[:notes])
  @note.save
  redirect '/'
end


post '/notes/destroy/:id' do
  Note.find(params[:id]).destroy
  redirect '/'
end



