module PostsHelper

  def post_publish_date post
    if post.published?
      [
        [ Post.human_attribute_name(:published_at), ':'].join,
        content_tag(:time, l(post.published_at, format: :short), datetime: post.published_at.to_s, title: l(post.published_at, format: :long))
      ].join(' ').html_safe
    else
      content_tag :span, t('warnings.not_published'), class: 'label label-warning'
    end
  end
end