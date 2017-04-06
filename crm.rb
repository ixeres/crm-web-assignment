require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/about' do
  erb :contact_about
end

get '/new_contact' do
  erb :new_contact
end

post '/contacts' do
  contact = Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.update(first_name: params[:first_name])
    @contact.update(last_name: params[:last_name])
    @contact.update(email: params[:email])
    @contact.update(note: params[:note])
    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end


get '/contacts/:id/buttondelete' do
  @contact = Contact.find(params[:id].to_i)
if @contact
  @contact.destroy
  redirect to('/')
else
  raise Sinatra::NotFound
end

end

after do
  ActiveRecord::Base.connection.close
end
