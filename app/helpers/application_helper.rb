# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: 'カクテルレシピアプリ',
      title: '最高のカクテルレシピ集',
      description: '簡単に作れる美味しいカクテルのレシピを紹介！',
      canonical: request.original_url,
      og: {
        title: '最高のカクテルレシピ集',
        description: '簡単に作れる美味しいカクテルのレシピを紹介！',
        type: 'website',
        url: request.original_url,
        image: image_url('default_ogp.png', resize_to_limit: [1200, 630]),
        site_name: 'カクテルレシピアプリ'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@your_twitter_handle',
        title: '最高のカクテルレシピ集',
        description: '簡単に作れる美味しいカクテルのレシピを紹介！',
        image: image_url('default_ogp.png', resize_to_limit: [1200, 630])
      }
    }
  end
end
