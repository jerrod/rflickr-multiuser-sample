# Rflickr & Rails Multi User Authentication
This is a sample rails app to demonstrate one way to accomplish per-user Flickr integration giving users access to their photosets.
  
## Usage
To use the app tool, obtain a Flickr API key and secret from http://www.flickr.com/services/api/keys/apply/ and add it to  /config/initializers/flickr_api.rb.  
Be sure to set the callback URL in the api creation form to the /flickr_auth/create wherever you app will be running .
(e.g http://0.0.0.0:3000/flickr_auth/create)

    rake db:migrate
    script/server start
    
Sign up for a new account, and then visit /flickr_auth/new to authorize the app with your flickr account.
The app will then display your photosets and photos at /photos
  

## Notes
rFlickr needs to be modified to allow the token to be stores ina nd retreived from the db. I have included the files in /lib/flickr

The changed files are 

    flickr/auth.rb 
    flickr/token.rb
    flickr/token_cache.rb
  
If anyone finds this useful then perhaps we can get this put into the rflickr gem, though i suspect there are better, cleaner REST implementations.  

## Todo
1. Tests for the rflickr integration.
