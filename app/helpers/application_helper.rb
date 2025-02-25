# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags(title: '最高のカクテルレシピ集', description: '簡単に作れる美味しいカクテルのレシピを紹介！', image: nil)
    image = image.blank? ? 'default_ogp.png' : image
    {
      site: 'カクテルレシピアプリ',
      title: title,
      description: description,
      canonical: request.original_url,
      og: {
        title: title,
        description: description,
        type: 'website',
        url: request.original_url,
        image: image,
        site_name: 'カクテルレシピアプリ'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@your_twitter_handle',
        title: title,
        description: description,
        image: image
      },
      facebook: {
        card: 'summary_large_image',
        site: '@your_facebook_handle',
        title: title,
        description: description,
        image: image
      }
    }
  end
end
