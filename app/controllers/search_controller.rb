class SearchController < ApplicationController
  def by_tag
    @tags = params[:tags]
    @sort = params[:sort]

    @photos = SearchHelper.searchByTags(@tags, @sort)
    
    respond_to do |format|
        format.js
        #format.html
    end
  end

  def sort
  end
end
