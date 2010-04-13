require 'rubygems'
gem 'sinatra', '~> 0.9.4'
require 'sinatra/base'
require 'stupid_formatter'
require 'yaml'
require 'builder'
$:.unshift File.dirname(__FILE__)
require 'ruby_ext'
require 'year_after_year'

class Serious < Sinatra::Base
  helpers Sinatra::YearAfterYear
  
  set :articles, Proc.new { File.join(Dir.getwd, 'articles') }
  set :pages, Proc.new { File.join(Dir.getwd, 'pages') }
  set :static, true # Required to serve static files, see http://www.sinatrarb.com/configuration.html
  
  not_found do
    erb :"404"
  end
  
  before do
    headers['Cache-Control'] = "public, max-age=#{Serious.cache_timeout}"
  end
  
  helpers do
    # Helper for rendering partial _archives
    def render_archived(articles)
      render :erb, :'_archives', :locals => { :articles => articles }, :layout => false
    end
    
    def render_article(article, summary_only=false)
      render :erb, :'_article', :locals => { :article => article, :summary_only => summary_only }, :layout => !summary_only
    end
    
    def render_partial(name)
      render :erb, :"_#{name}", :layout => false
    end
    
    def render_page(page)
      render :erb, :'_page', :locals => { :page => page }
    end
  end

  # Index page
  get '/' do
    @recent = Article.all(:limit => Serious.items_on_index)
    @archived = Article.all(:limit => Serious.archived_on_index, :offset => Serious.items_on_index)
    erb :index
  end
  
  get '/atom.xml' do
    @articles = Article.all(:limit => Serious.items_in_feed)
    builder :atom
  end
  
  # Specific article route
  get %r{^/(\d{4})/(\d{1,2})/(\d{1,2})/([^\\]+)} do
    halt 404 unless @article = Article.first(*params[:captures])
    render_article @article
  end
  
  # Archives route
  get %r{^/(\d{4})[/]{0,1}(\d{0,2})[/]{0,1}(\d{0,2})[/]{0,1}$} do
    selection = params[:captures].reject {|s| s.strip.length == 0 }.map {|n| n.length == 1 ? "%02d" % n : n}
    @articles = Article.find(*selection)
    @title = "Archives for #{selection.join("-")}"
    erb :archives
  end
  
  get "/archives" do
    @articles = Article.all
    @title = "Archives"
    erb :archives
  end
  
  get "/pages" do
    @articles = Page.all
    @title = "Pages"
    erb :archives
  end
  
  get "/pages/:page" do
    halt 404 unless @page = Page.find(params[:page])
    render_page @page
  end
  
  get "/categories/:category" do
    halt 404 unless @articles = Article.find_by_category(params[:category])
    @category = params[:category].capitalize
    erb :archives
  end
end

require 'serious/article'
require 'serious/page'
# Set up default stupid_formatter chain
StupidFormatter.chain = [StupidFormatter::Erb, StupidFormatter::RDiscount]

# Set up defaults for app
Serious.set :root, File.join(File.dirname(__FILE__), 'site')
Serious.set :title, "Serious"
Serious.set :author, "unknown"
Serious.set :url, 'http://localhost:3000'
Serious.set :items_in_feed, 25 # Number of items to display in atom feed
Serious.set :items_on_index, 3 # Number of items to display with summary on main page
Serious.set :archived_on_index, 10 # Number of items to display small (title only) on main page
Serious.set :cache_timeout, 300
Serious.set :run, false
Serious.set :environment, :production
Serious.set :date_format, "%B %o %Y"
Serious.set :disqus, false
Serious.set :google_analytics, false
Serious.set :feed_url, '/atom.xml'

