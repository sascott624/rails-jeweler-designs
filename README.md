# Rails Jeweler Designs

Welcome to the Rails Jeweler Designs app! Users can keep track of their designs and the stones used in each.  

# Getting Started

First, clone this repo, and run ```bundle install```. Then, run ```rake db:migrate``` to set up the database, and ```rake db:seed``` to seed it.

In order to login through facebook, you must first register the app on facebook. Once you have your FACEBOOK_APP_ID and FACEBOOK_SECRET, you'll need to export those values to your environment. ```dotenv``` is an efficient way to store and load the environment variables necessary to sign in through facebook. To set up, after bundling, create a ```.env``` file in the root of your directory, and enter the following code:

```
export FACEBOOK_APP_ID="your_facebook_app_id"
export FACEBOOK_SECRET="your_facebook_secret"
```

Be sure to add ```.env``` to your ```.gitignore```, if it's not already there.


# Signup and Login

Users can signup with a valid email and password, or through facebook. Once logged in, a user has the option to add their name and location (though this is not required). Users can view their profile and the profiles of other users, but can only update their own profile. Users can view their own designs, and the designs of other users, but again, can only create and update their own designs.

Guests can create a new stone, but must be logged in to create a design.
