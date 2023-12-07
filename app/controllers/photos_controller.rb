class PhotosController < ApplicationController

def show
  url_id=params.fetch("path_id")
  @the_photo = Photo.where({:id => url_id}).at(0)
  render({ :template => "photo_templates/show"})
end



  def index
  matching_photos = Photo.all
  @list_of_photos = matching_photos.order({ :created_at => :desc })
  render({ :template => "photo_templates/index"})
end

end
