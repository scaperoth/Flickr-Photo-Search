#
# author: Matt Scaperoth <matthew@scaperoth.com>
# description: this file uses an http request to 
# get API responses and returns them to a view or controller
#

module SearchHelper

  #get info of individual photo by id 
  def self.getPhotoInfo(photo_id, secret = nil)
    flickrAPI  = "https://api.flickr.com/services/rest/?"
    flickrAPI += "&method=flickr.photos.getInfo"
    flickrAPI += "&api_key=#{FLICKR_API_KEY}"
    flickrAPI += "&photo_id=#{photo_id}"
    if !secret.nil?
      flickrAPI += "&secret=#{secret}"
    end
    flickrAPI += "&format=json"
    flickrAPI += "&nojsoncallback=1"

    photo_info = get_request(flickrAPI)
  end

  #get a list of photos that have the tags provided
  def self.searchByTags(tags, sort = "", page = 1)

    #main url and api keys
    flickrAPI  = "https://api.flickr.com/services/rest/?"
    flickrAPI += "&api_key=#{FLICKR_API_KEY}"
    flickrAPI += "&safe_search=1"

    #attach the tags to the request
    flickrAPI += "&method=flickr.photos.search"
    flickrAPI += "&tags=#{tags}"
    
    #TODO: add paging
    #paging
    flickrAPI += "&per_page=20"
    flickrAPI += "&page=#{page}"

    #json formatting
    flickrAPI += "&format=json"
    flickrAPI += "&nojsoncallback=1"
    
    #if sorting exists
    if !sort.empty?
      flickrAPI += "&sort=#{sort}"
    end

    photos = get_request(flickrAPI)

  end

  #perform a http request given a url 
  def self.get_request(url)
    require 'net/http'

    uri = URI.parse(url)

    # Shortcut
    #response = Net::HTTP.post_form(uri, {"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})

    # Full control
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri)

    #request.set_form_data({"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})

    response = http.request(request)

    clean_response = response.body 

    formatted_response = JSON.parse(clean_response)

    formatted_response

  end

  #view accessible functions
  def getPhotoInfo(photo_id, secret = null)
    SearchHelper.getPhotoInfo(photo_id, secret)
  end

  def searchByTags(tags, sort = nil)
    SearchHelper.searchByTags(tags, sort)
  end

end
