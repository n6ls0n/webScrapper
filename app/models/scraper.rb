require "net/http"

class Scraper
  attr_reader :document

  def initialize(url)
    response = Net::HTTP.get(URI(url))
    @document = Nokogiri::HTML(response)
  end

  def text(url, selector:)
    document.at_css(selector).text
  end

  def present?(url, selector)
    document.at_css(selector).present?
  end
end
