class UsersController < ApplicationController
  def add
    new_user=User.new
    new_user.username=params.fetch("input_username")
    new_user.save
    redirect_to("/users")
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
