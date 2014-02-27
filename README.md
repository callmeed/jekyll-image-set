Jekyll Image Set
================

Create an Image Gallery from a Folder
----------------

Takes a dir (generally a subdirectory of your images folder), gets all the images from it, and creates HTML image and container tags.

Useful for creating an image gallery and the like.

Usage 
----------------

**default**

{% image_set images/gallery1 %}

(this will create a UL, then LI and IMG tags for each image in images/gallery1)

**with options**

{% image_set images/gallery2 --class=img-responsive --container-tag=div --wrap-tag=div %}

(this will set the class for the <img> tags and use <div>s for the container and wrap)

Options
----------------

--class=some_class 
sets the class for the <img> tags, default is 'image'

--wrap_tag=some_tag
sets the tag to wrap around each <img>, default is 'li'
--wrap_class=some_class
sets the class for wrap_tag, default is 'image-item'

--container_tag=some_tag
sets the tag to contain all <img>s, default is 'ul'

--container_class=some_class
sets the class for container_tag, default is 'image-set'

