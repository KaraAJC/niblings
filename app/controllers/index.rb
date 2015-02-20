get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/niblings' do
  @niblings_names = niblings.all.map(&:name)
  erb :niblings
end

post '/niblings' do
  new_niblings = niblings.create!(name: params[:name])
  redirect "/niblings/#{new_niblings.id}"
end

get '/niblings/new' do
  erb :new_niblings
end

get '/niblings/:id' do
  @niblings = niblings.find(params[:id])
  erb :show_niblings
end

get '/info' do
  Demo.new(self).info
end
