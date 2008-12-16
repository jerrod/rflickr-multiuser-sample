module Blavos
  module Flickr
    module ApiBaseExtensions
      def self.included(base)
        base.alias_method_chain :initialize, :object
      end
    	
      def initialize_with_object(flickr) @flickr = flickr end
    
    end
  end
end


