module SearchHelper
  def self.searchByTags(tags)

   flickrAPI += "https://api.flickr.com/services/rest/?"
flickrAPI += "&method=flickr.photos.search"
flickrAPI += "&api_key=9012151640d5486e63780579ff3b9cae"
flickrAPI += "&tags=#{tags}"
flickrAPI += "&per_page=5"
flickrAPI += "&page=1"
flickrAPI += "&format=json"

  end

  def get_request(url)
    require 'net/http'

    uri = URI.parse("url")

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
