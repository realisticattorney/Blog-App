# The Router


It looks at the HTTP verb (GET, POST, PUT, DELETE) 
and the URL that is being requested 
( "/posts",) in get "/posts"
and matches it with the appropriate controller action to run.
to: "posts#index" 

# when a request enters your application, Rails grabs all the parameters that came with it and makes them available for you in a special hash called
params
# typing $ rails routes into the command line will give you an output of all the routes that are available to your application







root to: "kittens#index" #kittens controller, index action (method)
e.g. the index action ("#index") is just the .index method that’s defined in the KittensController (CLass)



get "/posts", to: "posts#index"  # GET all the posts (aka “index” the posts)
get "/posts/:id", to: "posts#show"   # GET just one specific post (aka “show” that post)
get "/posts/new", to: "posts#new" ##several of those routes submit the SAME URL  (/posts/)  
#they just use different HTTP verbs (get post) 
#so Rails can send them to a different controller action (#new #show) method def within how many classes?
post "/posts", to: "posts#create"  # usually a submitted form
get "/posts/:id/edit", to: "posts#edit"
put "/posts/:id", to: "posts#update" # usually a submitted form
delete "/posts/:id", to: "posts#destroy"

Each of these routes is basically a Ruby method that matches that particular URL ("/posts/") and HTTP verb (get, put, post) with the correct controller "posts#" action "index".


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