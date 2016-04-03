class SearchController < ApplicationController
  def tag
    @tags = params[:tags]
    
    @photos = @tags.nil? ? nil : SearchHelper.searchByTags(@tags)
    
  end

  def sort
  end
end
