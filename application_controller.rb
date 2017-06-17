require 'bundler'
Bundler.require
require_relative 'models/model.rb'
class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/photography' do
    @status = "inactive"
    erb :photography
  end
  
  post '/photography' do
    #work on getting photos to show up on the same page-->no new page
    userType = params[:type]
    @photo = photography(userType)
    @status = "active"
    erb :photography
  end
  

  get '/music' do
    @status = "inactive"
    erb :music
    
  end
  
  post '/music' do
    userGenre = params[:genre].to_sym
    @userGenre = userGenre
    @result = music_playlists(@userGenre)
    @status = "active"
    erb :music
  end


  get '/visualart' do
    erb :visualart
  end  
  
  get '/about' do
    erb :about
  end

end