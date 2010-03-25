class Serious
  get '/articles' do    
    @recent = Article.all(:limit => Serious.items_on_index)
    @archived = Article.all(:limit => Serious.archived_on_index, :offset => Serious.items_on_index)
    erb :articles
  end
end

class Serious::Article
  def [] *args
    yaml[*args]
  end
end
