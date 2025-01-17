class UsersController < ApplicationController
  def update
    the_id=params.fetch("di")
    matching_user=User.where({:id => the_id})
    the_user=matching_user.at(0)
    the_user.username=params.fetch("input_username")
    the_user.save
    redirect_to("/users/"+the_user.username.to_s)

  end
  
  
  def add
    new_user=User.new
    new_user.username=params.fetch("input_username")
    new_user.save
    @the_user=new_user
    render({ :template => "user_templates/show"})
    #redirect_to("/users/")
  end
  
  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.at(0)
    render({ :template => "user_templates/show"})
  end
  
  
  
  def index
    matching_users = User.all
    @list_of_users= matching_users.order({:username => :asc})
    render({ :template => "user_templates/index"})
  end
end
