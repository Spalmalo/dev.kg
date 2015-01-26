module YoutubeHelper

  def youtube_embed url
    source = "//www.youtube.com/embed/#{ youtube_video_id url }"
    content_tag :iframe, nil, src: source,
                              frameborder: 0,
                              allowfullscreen: true
  end

  def youtube_video_id url
    query = URI(url).query
    params = Rack::Utils.parse_query query
    params.fetch 'v'
  end

  def youtube_video_thumbnail url
    "http://img.youtube.com/vi/#{ youtube_video_id url }/hqdefault.jpg"
  end

end