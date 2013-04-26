require 'net/http'

class Keyword < ActiveRecord::Base
  def query_solr(keyword)
#    solr = RSolr.connect :url => 'http://192.168.1.3:8983/solr'
#    response = solr.get 'select', :params => {:q => 'tweet:' + keyword}
#    response.to_s
    facebook_data(keyword)
  end

  private
  def facebook_data(keyword)
    uri = URI.parse('http://localhost/fb/example1.php')
    params = {'movie_name' => keyword}
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.path)
    request.set_form_data( params )

    request = Net::HTTP::Get.new( uri.path+ '?' + request.body )

    response = http.request(request)
    response.body
  end
end