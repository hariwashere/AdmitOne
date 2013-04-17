class KeywordsController < ApplicationController
  def new
  @keyword = Keyword.new
  end

  def create
    keyword_string = params[:keyword][:keyword]
    keyword = Keyword.new
    @op = keyword.query_solr(keyword_string)
  end
end