SitemapGenerator::Sitemap.default_host = "http://stroyexp.info"
SitemapGenerator::Sitemap.compress = false # :all_but_first

SitemapGenerator::Sitemap.create do
  add contact_path

  Activity.find_each do |model|
    add activity_path(model), lastmod: model.updated_at
  end

  add partners_path, priority: 0.7, changefreq: 'daily'
  Customer.published.find_each do |model|
    add partner_path(model), lastmod: model.updated_at
  end

  add objects_path, priority: 0.7, changefreq: 'daily'
  Target.published.find_each do |model|
    add object_path(model), lastmod: model.updated_at
  end

  add permits_path, priority: 0.7, changefreq: 'daily'
  Permit.published.find_each do |model|
    add permit_path(model), lastmod: model.updated_at
  end

  add articles_path, priority: 0.7, changefreq: 'daily'
  Article.published.find_each do |model|
    add article_path(model), lastmod: model.updated_at
  end

  add publishes_path, priority: 0.7, changefreq: 'daily'
  Publish.published.find_each do |model|
    add publish_path(model), lastmod: model.updated_at
  end

  add feedbacks_path, priority: 0.7, changefreq: 'daily'
  Feedback.published.find_each do |model|
    add feedback_path(model), lastmod: model.updated_at
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
