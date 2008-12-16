class FlickrAuthController < ApplicationController
  before_filter :redirect_flickr_authorized_users
  
  def redirect_flickr_authorized_users
    redirect_to({:controller=>:photos}) and return if current_user.flickr_info
  end

  def new
    unless flickr_object.auth.token
      flickr_object.auth.getFrob
      @flickr_url = flickr_object.auth.login_link
    end
  end

  def create
   flickr_object.auth.getToken(params[:frob])
   current_user.update_attribute(:flickr_token, flickr_object.auth.token)
  end

  
end
