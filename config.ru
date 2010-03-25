require 'serious'
Serious.set :title, 'sideline-ca'
Serious.set :author, 'Your Name here'
Serious.set :url, 'http://sideline-ca.heroku.com'
Serious.set :root, Dir.getwd

class Serious
  get '/articles' do
    @recent = Article.all(:limit => Serious.items_on_index)
    @archived = Article.all(:limit => Serious.archived_on_index, :offset => Serious.items_on_index)
    erb :articles
  end
end

run Serious
