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

   $ bin/rails generate controller Articles index --skip-routes #it creates the controller ArticlesController (convention over configuration) and a few folders and files more. Lets see the controller it created:

   class ArticlesController < ApplicationController
      def index
      end
    end

    #the index action is empty. When an action does not explicitly render a view (or otherwise trigger an HTTP response), Rails will automatically render a view (that's a file) that matches the name of the controller and action (which will created for you). Convention Over Configuration! Views are located in the app/views directory. So the index action will render app/views/articles/index.html.erb

    However, we need to map the root path to the appropiate controller and action we just created (which shows view file index, that I've changed for <h1>Hello, Rails<h1>)



    generating a model

    $ bin/rails generate model Article title:string body:text
will create
    (db/migrate/<timestamp>_create_articles.rb) and the model file (app/models/article.rb).

    (extract from db/migrate/time_stamp):'

    class CreateArticles < ActiveRecord::Migration[6.1]
      def change
        create_table :articles do |t|
          t.string :title
          t.text :body
    
          t.timestamps
        end
      end
    end
    
'
    The call to create_table specifies how the articles table should be constructed. By default, the create_table method adds an id column as an auto-incrementing primary key. So the first record in the table will have an id of 1, the next record will have an id of 2, and so on.

    Inside the block for create_table, two columns are defined: title and body. These were added by the generator because we included them in our generate command (bin/rails generate model Article title:string body:text).

   On the last line of the block is a call to t.timestamps. This method defines two additional columns named created_at and updated_at. As we will see, Rails will manage these for us, setting the values when we create or update a model object.


   5.3 Using a Model to Interact with the Database
now I turned the irb on console with bin/rails console
and Im initializing a new  Article object 

article = Article.new(title: "Hello Rails", body: "I am on Rails!")

as irb is not part of the actual app (it s more like temporary) we saved it

article.save
'
Article Create (0.4ms)  INSERT INTO "articles" ("title", "body", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["title", "Hello Rails"], ["body", "I am on Rails!"], ["created_at", "2020-01-18 23:47:30.734416"], ["updated_at", "2020-01-18 23:47:30.734416"]]
(0.9ms)  commit transaction
=> true
article.save
'
The above output shows an INSERT INTO "articles" ... database query. This indicates that the article has been inserted into our table. And if we take a look at the article object again, we see something interesting has happened:

article
=> #<Article id: 1, title: "Hello Rails", body: "I am on Rails!", created_at: "2020-01-18 23:47:30", updated_at: "2020-01-18 23:47:30">
'
# at this point, I dont get where the model generated, is connected to the object initialized. is due to the rooth path? Is it because the name Articles it's not understood as just a name, but one that it's already part of the convention so when you use Article is automatically gets it as part of that class. Or idk...


Article.find(1)
=> #<Article id: 1, title: "Hello Rails", body: "I am on Rails!", created_at: "2020-01-18 23:47:30", updated_at: "2020-01-18 23:47:30">
#we see that of the class Article, object w id = 1 is stored

# here a new method called all

Article.all
=> #<ActiveRecord::Relation [#<Article id: 1, title: "Hello Rails", body: "I am on Rails!", created_at: "2020-01-18 23:47:30", updated_at: "2020-01-18 23:47:30">]>

#looks like an array where each item is itself a key-value pair
Next, we will connect all of the pieces together.

5.4 Showing a List of Articles


