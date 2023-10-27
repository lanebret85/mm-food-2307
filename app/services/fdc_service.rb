class FdcService
  attr_reader :query_params
  
  def initialize(query_params)
    @query_params = query_params
  end

  def conn
    Faraday.new(
      url: "https://api.nal.usda.gov/fdc/",
      headers: { "X-Api-Key": "#{Rails.application.credentials.fdc[:key]}" }
    )
  end

  def search
    response = conn.get("v1/foods/search") do |f|
      f.params["query"] = @query_params[:q]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def food_data
    search[:foods].first(10)
  end
end