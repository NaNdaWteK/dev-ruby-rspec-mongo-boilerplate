require 'sinatra/base'

class App < Sinatra::Base
  enable :static, :sessions

  set :public_folder, 'app/'

  get '/' do
    p 'Working'
  end
end
