class Serious::Page < Serious::Article
  class << self
    #
    # Returns all pages
    #
    def all
      @all ||= page_paths.map { |path| new(path) }
    end
    
    def find(permalink)
      all.find_all {|page| page.permalink == File.basename(permalink) }.first
    end
            
    private
    
      # Returns all page files in pages path
      def page_paths
        @pages_paths ||= Dir[File.join(Serious.pages, "*.#{Serious.extension}#{Sinatra::Application.environment == :production ? '' : '*'}")].sort
      end
  end

  def articles
    @articles = Serious::Article.find_by_category(permalink)
  end
    
  def url
    "/#{permalink}"
  end
  
  private
  
    # Will extract the permalink from the filename.
    def extract_date_and_permalink!
      @permalink = File.basename(path).split('.')[0]
    end
end
