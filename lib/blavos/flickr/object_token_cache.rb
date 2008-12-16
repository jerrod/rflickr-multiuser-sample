class Blavos::Flickr::ObjectTokenCache < Flickr::BaseTokenCache

  def initialize(flickr_object)
  	@flickr_object = flickr_object
  end

  def load_token
  	token = nil
  	
    @token = Flickr::Token.from_object(@flickr_object)
    rescue Errno::ENOENT
  	nil
  end

  def cache_token(token)
    nil
  end

end