xml.instruct!
xml.urlset :xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc Serious.url
    xml.changefreq "daily"
    xml.priority "1.0"
    xml.lastmod @last.xmlschema
  end
  @articles.each do |article|
    xml.url do
      xml.loc File.join(Serious.url, article.url)
      xml.lastmod article.last_modified.xmlschema
    end
  end
end
