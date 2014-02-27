Jekyll Image Set
================

Create an Image Gallery from a Folder
----------------

Takes a dir (generally a subdirectory of your images folder), gets all the images from it, and creates HTML image and container tags.

Useful for creating an image gallery and the like.

Installation
----------------

Place the image_set.rb file in the _plugins directory of your Jekyll site

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

<code>--class=some_class</code>
sets the class for the <img> tags, default is 'image'

<code>--wrap_tag=some_tag</code>
sets the tag to wrap around each <img>, default is 'li'

<code>--wrap_class=some_class</code>
sets the class for wrap_tag, default is 'image-item'

<code>--container_tag=some_tag</code>
sets the tag to contain all <img>s, default is 'ul'

<code>--container_class=some_class</code>
sets the class for container_tag, default is 'image-set'

Known Issues
----------------

* Cannot add multiple clasess to <img> tags or wrap/container tags
* No way to set ALT or other attributes for <img> tags. Need this for SEO probably. 
* Tabs/indentation is crappy 

