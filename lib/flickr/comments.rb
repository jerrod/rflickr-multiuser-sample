require 'flickr/base'

class Flickr::Comments < Flickr::APIBase

	def add(photo, comment)
		photo = photo.id if photo.class == Flickr::Photo
		res = @flickr.call_method('flickr.photos.comments.addComment',
			'photo_id' => photo, 'comment_text' => comment)
		xml = res.root
		xml.attributes['id']
	end

	def delete(comment_id)
		@flickr.call_method('flickr.photos.comments.deleteComment',
			'comment_id' => comment_id)
	end

	def edit(comment_id, comment)
		@flickr.call_method('flickr.photos.comments.editComment',
			'comment_id' => comment_id, 'comment_text' => comment)
	end

	def list(photo)
		photo = photo.id if photo.class == Flickr::Photo
		res = @flickr.call_method('flickr.photos.comments.getList',
			'photo_id' => photo)
		rv = []
		res.elements['//comments'].each_element do |e|
			rv << Flickr::Comment.from_xml(e, @flickr)
		end
		rv
	end


end
