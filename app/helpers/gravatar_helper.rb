module GravatarHelper

  def gravatar email, size=80, alt=''
    image_tag gravatar_url(email, size), alt: alt, style: "height: #{ size }px; width: #{ size }px;"
  end

  def gravatar_url email, size
    "http://www.gravatar.com/avatar/#{ gravatar_hash email }?s=#{ size }"
  end

  def gravatar_profile_url email
    "http://www.gravatar.com/#{ gravatar_hash email }"
  end

  def gravatar_hash email
    Digest::MD5.hexdigest(email.downcase)
  end

  def gravatar_profile_link email, size=80, alt=''
    link_to gravatar(email, size, alt), gravatar_profile_url(email), class: 'gravatar_profile_link', data: { size: size }
  end

end