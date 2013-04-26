require 'net/http'

class Keyword < ActiveRecord::Base
  def twitter_data(keyword)
    solr = RSolr.connect :url => 'http://10.0.0.10:8983/solr'
    response = solr.get 'select', :params => {:q => 'tweet:' + keyword}
    response['response']['docs']
  end

  def facebook_data(keyword)
    uri = URI.parse('http://localhost/fb/example1_edit.php')
    params = {'movie_name' => keyword}
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.path)
    request.set_form_data( params )

    request = Net::HTTP::Get.new( uri.path+ '?' + request.body )

    response = http.request(request)
    response.body
  end
end