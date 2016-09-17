#Rails Jeweler Designs

###About

Welcome to the Rails Jeweler Designs app! This app leverages JQuery with a Rails API backend. Users can keep track of their designs and the stones used in each.  

###Dependencies

The Rails API was built using Rails 5.0.0.1, and a sqlite3 database. It requires the  ```active_model_serializers``` gem for serialization, as well as the ```dotenv-rails``` gem to load environment variables. Lastly, it requires the ```devise```, ```omniauth```, and ```omniauth-facebook``` gems for user authentication.


###Installation

First, clone this repo, and run ```bundle install```. Then, run ```rake db:migrate``` to set up the database, and ```rake db:seed``` to seed it.

In order to login through facebook, you must first register the app on facebook. Once you have your FACEBOOK_APP_ID and FACEBOOK_SECRET, you'll need to export those values to your environment. ```dotenv``` is an efficient way to store and load the environment variables necessary to sign in through facebook. To set up, after bundling, create a ```.env``` file in the root of your directory, and enter the following code:

```
export FACEBOOK_APP_ID="your_facebook_app_id"
export FACEBOOK_SECRET="your_facebook_secret"
```

Be sure to add ```.env``` to your ```.gitignore```, if it's not already there.


###Signup and Login

Users can signup with a valid email and password, or through facebook. Once logged in, a user has the option to add their name and location (though this is not required). Users can view their profile and the profiles of other users, but can only update their own profile. Users can view their own designs, and the designs of other users, but again, can only create and update their own designs.

Guests can create a new stone, but must be logged in to create a design.

###Contributors

 Pull requests are welcome.  Contributors, please adhere to the [Contributor Covenant code of conduct](http://contributor-covenant.org/).


###License

The MIT License (MIT)

Copyright (c) 2016 Lindsey Wells

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
