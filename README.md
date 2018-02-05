# Flex-out Calculator

CS121 (Software Development) spring '18

Contributor(s): Natalie Kadonaga HMC '19 (nkadonaga)



## Summary
This application, given an amount of "flex" (allocated meal plan funds that expire every week), will calculate which products from Jay's to purchase so that a minimum of flex is left over. 

We've all been in the "flex-out" scenario. It's the end of the week on a Saturday night, you still have $7 of flex left, and you have to run to Jay's to spend all of it before it expires at midnight. You don't want to bring too many items to the cashier (since it's embarrassing to put them back) and you don't want to bring too little (since you'll be wasting your flex when the extra expires). 

You're one of two people. You either pull out your phone's calculator app, look at the prices around you, and start punching in numbers, or you're doing mental math and juggling carry digits around in your head. 

Instead, save yourself the time and the energy by having this calculator do the work for you, so you can get a spot in the long cashier line quickly and get back to your busy life!

## Users

This application is intended for Claremont Colleges students on the meal plan.

## MVP

Essential features of the MVP:

* show list of products
* allow users to create, update, and delete products
* take in a flex amount
* correctly calculate a list of products to buy

### TODO

*What features are essential for your MVP? Whatever you built should be fully functional, so make sure you get your MVP working before adding extra features and functionality. A clear, complete, well-written, and engaging description that describes all features of the product.*

## Functionality

### TODO

*This overview should convince the user that they want your product and to inform an already existing user of all features that you offer. This description can include pictures, diagrams, text, bullets, or whatever you think will best convey the functionality that you are offering. (Make sure to properly label and caption all your figures and tables.) A-level work. Full credit for including nice/informative screenshots that demonstrate the functionality.*

## Installation Steps
The app uses Ruby 2.5.0p0 and Rails 5.1.4.

For local deployment, follow these instructions:

1. Install gem dependencies in the `Gemfile` using: `$bundle install`

2. Run the server on port 3000 using: `$bin/rails server`

3. Navigate to [http://localhost:3000](http://localhost:3000).

## Issues/Known Bugs

### TODO

## References
[http://guides.rubyonrails.org/getting_started.html](http://guides.rubyonrails.org/getting_started.html)

http://guides.rubyonrails.org/active_record_validations.html

https://docs.ruby-lang.org/en/2.0.0/

http://api.rubyonrails.org/classes/ActiveModel/Errors.html

https://stackoverflow.com/questions/8097750/array-attribute-for-ruby-model

https://help.github.com/articles/licensing-a-repository/

https://apidock.com/rails/v4.0.2/ActionView/Helpers/FormOptionsHelper/collection_check_boxes