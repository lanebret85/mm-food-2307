class SearchFacade
  attr_reader :query_params
  
  def initialize(query_params)
    @query_params = query_params
  end

  def foods
    data = FdcService.new(@query_params).food_data
    data.map do |food|
      Food.new(food)
    end
  end

  def search
    data = FdcService.new(@query_params).search
    Search.new(data)
  end
end