module Blavos
  module Flickr
    module TokenExtensions
      
    	def self.from_object(object, flickr=nil)
    		token = object.token
    		perms = object.perms
    		user  = object.user
    		nsid  = object.user.nsid
    		username = object.user.username
    		realname = object.user.realname

    		p = flickr.person_cache_lookup(nsid) if flickr
    		p ||= Flickr::Person.new(flickr,nsid,username)
    		p.realname=realname
    		flickr.person_cache_store(p) if flickr

    		return Flickr::Token.new(token,perms,p)
    	end
    end
  end
end