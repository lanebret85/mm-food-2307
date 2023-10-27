class Search
  attr_reader :total_hits

  def initialize(search_info)
    @total_hits = search_info[:totalHits]
  end
end