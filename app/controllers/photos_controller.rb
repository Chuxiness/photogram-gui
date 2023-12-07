class PhotosController < ApplicationController
  def comment
    new_comment=Comment.new
    new_comment.body=params.fetch("input_comment")
    redirect_to("/photos/"+the_image.id.to_s)
  end
  
  def update
    the_id=params.fetch("modify_id")
    matching_image=Photo.where({:id => the_id})
    the_image=matching_image.at(0)
    the_image.image=params.fetch("input_image")
    the_image.caption=params.fetch("input_caption")
    #the_image.owner_id=params.fetch("input_owner_id")
    the_image.save
    redirect_to("/photos/"+the_image.id.to_s)
  end
  
  
  def insert
    new_image = Photo.new
    new_image.image=params.fetch("input_image")
    new_image.caption=params.fetch("input_caption")
    new_image.owner_id=params.fetch("input_owner_id")
    new_image.save
    #@the_photo = new_image
    #render({ :template => "photo_templates/show"})  
    redirect_to("/photos/"+new_image.id.to_s)
  end



  def bai
    the_id=params.fetch("toast_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy
    redirect_to("/photos")
    #render({ :template => "photo_templates/bai"})
  end

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
