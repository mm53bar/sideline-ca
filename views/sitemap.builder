xml.instruct!
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc Serious.url
    xml.changefreq "daily"
    xml.priority "1.0"
    xml.lastmod @last.xmlschema
  end
  @pages.each do |page|
    xml.url do
      xml.loc page.full_url
      xml.changefreq "daily"
      xml.priority "0.8"     
      xml.lastmod page.last_modified.xmlschema
    end
  end  
  @articles.each do |article|
    xml.url do
      xml.loc article.full_url
      xml.changefreq "daily"
      xml.priority "0.6"      
      xml.lastmod article.last_modified.xmlschema
    end
  end
end
