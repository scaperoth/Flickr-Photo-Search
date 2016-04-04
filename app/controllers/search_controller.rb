#
# author: Matt Scaperoth <matthew@scaperoth.com>
# description: this file uses the search helper (helpers/search_helper.rb) to return 
# a list of photos based on the user input

class SearchController < ApplicationController
  def by_tag
    @tags = params[:tags]
    @sort = params[:sort]

    #TODO: Add paging

    #use helper to get photos from tags
    @photos = SearchHelper.searchByTags(@tags, @sort)
    
    #send response to javascript file
    respond_to do |format|
        format.js
    end
  end

  def sort
  end
end
