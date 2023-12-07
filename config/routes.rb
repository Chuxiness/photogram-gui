Rails.application.routes.draw do
get("/users", { :controller =>"users", :action => "index"})
get("/users/:path_username", { :controller =>"users", :action => "show"})
post("/add_user", { :controller =>"users", :action => "add"})

get("/photos", { :controller =>"photos", :action => "index"})
get("/photos/:path_id", { :controller =>"photos", :action => "show"})
get("/delete_photo/:toast_id", { :controller =>"photos", :action => "bai"})
post("/insert_photo_record", {:controller =>"photos", :action => "insert"})
post("/update_photo/:modify_id", { :controller =>"photos", :action => "update"})
post("/add_comment", { :controller =>"photos", :action => "comment"})

end
