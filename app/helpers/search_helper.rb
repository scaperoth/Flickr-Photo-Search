module SearchHelper
  def self.searchByTags(tags)

  end

  def get_request(url)
    require 'net/http'

    uri = URI.parse("http://example.org")

    # Shortcut
    #response = Net::HTTP.post_form(uri, {"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})

    # Full control
    http = Net::HTTP.new(uri.host, uri.port)

    request = Net::HTTP::Post.new(uri.request_uri)
    
    #request.set_form_data({"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})

    response = http.request(request)
    
    formatted_response = JSON.parse(response.body)
    
    formatted_response
    
  end

  def searchByTags(tags)
    SearchHelper.searchByTags(tags)
  end

end
