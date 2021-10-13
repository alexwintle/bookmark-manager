require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/add-bookmark' do
    Bookmark.create(params['bookmark_url'])
    redirect '/'
  end

  run! if app_file == $0
end
