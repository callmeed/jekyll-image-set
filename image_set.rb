# ImageSet Liquid Plugin
# by Erik Dungan
# erik.dungan@gmail.com / @callmeed
# 
# Takes a dir, gets all the images from it, and creates HTML image and container tags
# Useful for creating an image gallery and the like 
# 
# USAGE
# default: {% image_set images/gallery1 %}
# (this will create a UL, then LI and IMG tags for each image in images/gallery1)
# 
# with options: {% image_set images/gallery2 --class=img-responsive --container-tag=div --wrap-tag=div %}
# (this will set the class for the <img> tags and use <div>s for the container and wrap)
# 
# OPTIONS
# --class=some_class (sets the class for the <img> tags, default is 'image')
# --wrap_tag=some_tag (sets the tag to wrap around each <img>, default is 'li')
# --wrap_class=some_class (sets the class for wrap_tag, default is 'image-item')
# --container_tag=some_tag (sets the tag to contain all <img>s, default is 'ul')
# --container_class=some_class (sets the class for container_tag, default is 'image-set')


module Jekyll
  class ImageSet < Liquid::Tag
    @path = nil

    @class = nil
    @wrap_class = nil
    @wrap_tag = nil
    @container_tag = nil
    @container_class = nil

    def initialize(tag_name, text, tokens)
      super

      # The path we're getting images from (a dir inside your jekyll dir)
      @path = text.split(/\s+/)[0].strip

      # Defaults
      @class = 'image'
      @wrap_class = 'image-item'
      @wrap_tag = 'li'
      @container_tag = 'ul'
      @container_class = 'image-set'

      # Parse Options
      if text =~ /--class=(\S+)/i
        @class = text.match(/--class=(\S+)/i)[1]
      end
      if text =~ /--wrap-class=(\S+)/i
        @wrap_class = text.match(/--wrap-class=(\S+)/i)[1]
      end
      if text =~ /--wrap-tag=(\S+)/i
        @wrap_tag = text.match(/--wrap-tag=(\S+)/i)[1]
      end
      if text =~ /--container-tag=(\S+)/i
        @container_tag = text.match(/--container-tag=(\S+)/i)[1]
      end
      if text =~ /--container-class=(\S+)/i
        @container_class = text.match(/--container-class=(\S+)/i)[1]
      end

    end

    def render(context)
      # Get the full path to the dir
      # Include a filter for JPG and PNG images
      full_path = File.join(context.registers[:site].config['source'], @path, "*.{jpg,jpeg,JPG,JPEG,png,PNG}")
      # Start building tags
      source = "<#{@container_tag} class='#{@container_class}'>\n"
      # Glob the path and create tags for all images
      Dir.glob(full_path).each do |image|
        file = Pathname.new(image).basename
        src = File.join('/', @path, file)
        source += "<#{@wrap_tag} class='#{@wrap_class}'>\n"
        source += "<img src='#{src}' class='#{@class}'>\n"
        source += "</#{@wrap_tag}>\n"
      end
      # Close it up 
      source += "</#{@container_tag}>\n"
      source
    end
  end
end

Liquid::Template.register_tag('image_set', Jekyll::ImageSet)
