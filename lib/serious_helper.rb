class Serious
  class Article
    def article_paths
      @article_paths ||= Dir[File.join('pages', '*')].sort
    end
  end
end
