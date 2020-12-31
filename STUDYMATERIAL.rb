# The Router


It looks at the HTTP verb (GET, POST, PUT, DELETE) 
and the URL that is being requested 
get "/posts"
and matches it with the appropriate controller action to run.
to: "posts#index" 

# when a request enters your application, Rails grabs all the parameters that came with it and makes them available for you in a special hash called
params
# typing $ rails routes into the command line will give you an output of all the routes that are available to your application


root to: "kittens#index" #kittens controller, index action (method)
e.g. the index action ("#index") is just the .index method defined within KittensController (CLass)



get "/posts", to: "posts#index"  # GET all the posts (aka “index” the posts)
get "/posts/:id", to: "posts#show"   # GET just one specific post (aka “show” that post)
get "/posts/new", to: "posts#new" ##several of those routes submit the SAME URL  (/posts/)  
#they just use different HTTP verbs (get post) 
#so Rails can send them to a different controller action (#new #show) method def within how many classes?
post "/posts", to: "posts#create"  # usually a submitted form
get "/posts/:id/edit", to: "posts#edit"
put "/posts/:id", to: "posts#update" # usually a submitted form
delete "/posts/:id", to: "posts#destroy"


# GET the page that lets you create a new post (aka view the “new” post page)
# GET all the posts (aka “index” the posts)
# POST the data you just filled out for a new post back to the server so it can create that post (aka “create” the post)
# GET the page that lets you edit an existing post (aka view the “edit” post page)
# PUT the data you just filled out to edit the post back to the server so it can actually perform the update (aka “update” the post)
# DELETE one specific post by sending a delete request to the server (aka “destroy” the post)


lets see an example from $ rails routes
"name of the route"                     "http verb"                       "URL"                    "(just a thing to say doesnt need an .extension"
new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
"then the controller"                               "and its action"



30 dic

so, this is a route to add at routes.rb

Rails.application.routes.draw do
   get "/articles", to: "articles#index"
 
   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 end

 The route above declares that GET /articles requests are mapped to the index action of ArticlesController

 "mapping" in programming means taking several things and then somehow associating each of them with another thing.
 in this case taking /articles and associating each item in articles with index on ArticlesController

   $ bin/rails generate controller Articles index --skip-routes #it creates the controller ArticlesController (convention over configuration)
   