# coding: utf-8
Plugin.create :photo_support_gyazo do
  # gyazoがなんか展開できないのもあるらしい
  defimageopener('gyazo', %r<\Ahttps?://gyazo.com/[a-zA-Z0-9]+>) do |display_url|
    connection = HTTPClient.new
    page = connection.get_content(display_url)
    next nil if page.empty?
    doc = Nokogiri::HTML(page)
    result = doc.css('.image').first
    open(result.attribute('src'))
  end
end
