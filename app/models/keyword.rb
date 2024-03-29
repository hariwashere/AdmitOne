require 'net/http'

class Keyword < ActiveRecord::Base
  def twitter_data(keyword)
    solr = RSolr::Ext.connect :url => 'http://128.61.29.245:8983/solr'

    #response = solr.get 'select', :params => {:q => 'tweet:"' + keyword + '"'}
    solr_params = {
        :phrases=>{:tweet => keyword},
        :facets=>{:fields=>['tweet']},
        :rows=> 1000
    }
    solr.find solr_params, :method => :post
  end

  def facebook_data(keyword)
    uri = URI.parse('http://localhost/fb/example1_edit.php')
    params = {'movie_name' => keyword}
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.path)
    request.set_form_data( params )

    request = Net::HTTP::Get.new( uri.path+ '?' + request.body )

    response = http.request(request)
    JSON.parse(response.body)   rescue {}
  end

  def imdb_data(keyword)

    uri = URI.parse("http://imdbapi.org/")
    params = {'q' => keyword, 'plot' => 'full'}
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.path)
    request.set_form_data( params )

    request = Net::HTTP::Get.new( uri.path+ '?' + request.body )

    response = http.request(request)
    JSON.parse(response.body)[0]
    end
end