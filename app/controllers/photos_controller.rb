class PhotosController < ApplicationController
  before_filter :flickr_auth_required
  
  def flickr_auth_required
   ( current_user.flickr_info ) ? true : redirect_to( {:controller=>:flickr_auth, :action=>:new} ) and return false
  end
  
  def index
    @flickr_photosets = flickr_object.photosets.getList
  end

end
