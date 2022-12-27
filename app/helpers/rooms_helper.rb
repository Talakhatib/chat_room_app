module RoomsHelper
    def gravatar_for(room, options = { size: 80 })
        size = options[:size]
        gravatar_id = Digest::MD5::hexdigest(room.name.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: room.name, class: "gravatar")
    end
end
