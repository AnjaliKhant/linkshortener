class LongToShortUrl < ApplicationRecord
  has_many :visitors
  before_create :generate_short_url

  validates_presence_of :original_url
  validates :original_url, format: URI::regexp(%w[http https])

  private
  
  def generate_short_url
    url_hash = Digest::SHA256.hexdigest(self.original_url)
    self.short_url = url_hash[0..6] # shorten to 7 characters
    while LongToShortUrl.exists?(short_url: self.short_url)
      self.short_url = url_hash[rand(url_hash.length - 7)..-1]
    end
  end
end
