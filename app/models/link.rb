class Link < ActiveRecord::Base  
  
  validates_presence_of :url  
  validates :url, format: { with: URI::regexp(%w[http https]), message: "Invalid" }
  validates_uniqueness_of :encoded_string  
  validates_length_of :url, within: 3..255, on: :create, message: "Invalid URL Length"  
  validates_length_of :encoded_string, within: 3..255, on: :create, message: "Invalid URL Length"
  
  # auto encoded_string generation
  before_validation :generate_encoded_string

  # the API
  def self.shorten(url, encoded_string = '')
    link = Link.find_or_create_by!(url: url, encoded_string: encoded_string)
    return link.short
  end
  
  def self.lengthen(url)
    encoded_string = URI(url).path[1..-1]
    link = Link.find_by_encoded_string!(encoded_string)
    link.url  
  end

  # fast access to the shortened link
  def short
    Rails.application.routes.url_helpers.short_url(encoded_string: self.encoded_string)
  end

  private
  
  def generate_encoded_string
    self.encoded_string = SecureRandom.uuid[0..5] if self.encoded_string.blank?
  end
end