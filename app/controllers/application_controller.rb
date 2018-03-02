require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :super_hero
  end

  post '/teams' do
    erb :team
    @team = Team.new(params[:team])

    params[:teams][:heros].each do |details|
      Hero.new(details)
    end
    @heros = Hero.all

    erb :team
  end

end
