DisqusRails.setup do |config|
  config::SHORT_NAME = ENV["DISQUS_SHORT_NAME"]
  config::SECRET_KEY = ENV["DISQUS_SECRET_KEY"]
  config::PUBLIC_KEY = ENV["DISQUS_PUBLIC_KEY"]
  config::ACCESS_TOKEN = ENV["DISQUS_ACCESS_TOKEN"]
end