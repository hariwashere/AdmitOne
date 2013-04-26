class KeywordsController < ApplicationController
  def new
  @keyword = Keyword.new
  end

  def create
    keyword_string = params[:keyword][:keyword]
    keyword = Keyword.new
    @twitter_data = keyword.twitter_data(keyword_string)
    @facebook_data = keyword.facebook_data(keyword_string)
    @imdb_data = keyword.imdb_data(keyword_string)
  end
end