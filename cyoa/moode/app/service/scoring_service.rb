require 'sentimental'

class Sentimentalizer
  THRESHOLD = 0.1

  def initialize(dictionary = nil)
    Sentimental.load_senti_file(dictionry) if dictionary
    Sentimental.load_defaults unless dictionary
    @sentimental = Sentimental.new(THRESHOLD)
  end

  def score(*texts)
    texts.map { |text| @sentimental.get_score text }
  end

  def set_threshold(threshold)
    @sentimental = Sentimental.new(threshold)
  end

end
