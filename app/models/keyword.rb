class Keyword < ActiveRecord::Base
  def query_solr(keyword)
    solr = RSolr.connect :url => 'http://192.168.1.3:8983/solr'
    response = solr.get 'select', :params => {:q => 'tweet:' + keyword}
    response.to_s
  end
end