module Blavos
  module Flickr
    module AuthExtensions
      def self.included(base)
        base.alias_method_chain :initialize, :object
      end
    	
    	def initialize_with_object(flickr, token_cache=nil)
    		super(flickr)
    		@frob = nil
    		@token = nil
    		@token_cache = case token_cache
    		when Object
    		  Flickr::ObjectTokenCache.new token_cache if token_cache
    		when String
    			Flickr::FileTokenCache.new token_cache
    		else
    			token_cache
    		end
    		@token = @token_cache.load_token if @token_cache
    	end
    end
  end
end
