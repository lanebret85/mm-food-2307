class FoodsController < ApplicationController
  def index
    @facade = SearchFacade.new(params)
  end
end