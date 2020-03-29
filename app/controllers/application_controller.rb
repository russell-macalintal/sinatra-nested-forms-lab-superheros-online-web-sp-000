require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      @team = Team.new(params[:team])

      params[:team][:members].each do |superhero|
        Superhero.new(superhero)
      end

      @members = Superhero.all

      erb :team
    end

end

# params = {
#   team => {
#     name => ??,
#     motto => ??,
#     members => [
#       {name => ??,
#       power => ??,
#       bio => ??},
#       {name => ??,
#       power => ??,
#       bio => ??},
#       .....
#     ]
#   }
# }
