
class Serious
  get '/articles' do    
    @recent = Article.all(:limit => Serious.items_on_index)
    @archived = Article.all(:limit => Serious.archived_on_index, :offset => Serious.items_on_index)
    erb :articles
  end
  
  class Article

  
    def article_paths
      @article_paths ||= Dir[File.join('pages', '*')].sort
    end
  end
end
