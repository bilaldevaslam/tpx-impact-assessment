# README

To run this app on your local machine (mac/ubuntu/ any other Linux based):

make sure you got the ruby version installed see (.ruby-version file)

run: bundle install

run: rails db:setup

run: rails s

For test case

run: bundle exec rspec

Now go to Postman and import this API for testing

https://www.getpostman.com/collections/8fce960af8ea305a67a0

  POST http://localhost:3000/api/v1/links/encode

  POST http://localhost:3000/api/v1/links/decode

  PUT http://localhost:3000/api/v1/status

Steps Need to follow

  1 - Go to Postman and run "Encode URL" API with the right data. It will return the short URL as repsonse
      - Pass URL (required)
      - Pass encoded_string (optional: if not passed, a unique encoded_string will be assigned to it) 

  2 - To get the original URL form a short URL, run 'Decode URL' with short url as data. It will return the original URL as response

Criterias Covered

  - HTTP POST to http://localhost:3000/api/v1/links/encode will return encoded URL
  - HTTP POST to http://localhost:3000/api/v1/links/decode will return original decoded URL
  - Every request to encode a URL persists the link and it is persists in database when a new URL is sent to encode

Additional

  - Short URL is functional and redirects to original URL when clicked
  - Database is used in backend to persist Links, So any number of URLs can be encoded and all will be decoded without any issue

Assumptions

  - I did not use any gem as we have to only give API endpoint for creating, but when we need to work on advance we can use  active_model_serializers, jsonapi-rb or blueprinter and even can make our custom validator for each action upon need

  - I have made code generic which will make any model basic API without writing any code in the controller
