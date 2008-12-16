# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'c70bcf3d117e0e310182582386044885'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  before_filter :login_required
  
  # API objects that get built once per request
  helper_method :flickr_object
  def flickr_object
    flickr_token = (logged_in?) ? ((current_user.flickr_token) ? current_user.flickr_info : "") : ""
    @flickr_object ||= Flickr.new(flickr_token, FLICKR_KEY, FLICKR_SECRET)
  end
 
end
