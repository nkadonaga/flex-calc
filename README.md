# Flex-out Calculator

CS121 (Software Development) spring '18

Contributor(s): Natalie Kadonaga HMC '19 (nkadonaga)



## Summary
This application, given an amount of "flex" (allocated meal plan funds that expire every week), will calculate which products from Jay's to purchase so that a minimum of flex is left over. 

We've all been in the "flex-out" scenario. It's the end of the week on a Saturday night, you still have 7 dollars of flex left, and you have to run to Jay's to spend all of it before it expires at midnight. You don't want to bring too many items to the cashier (since it's embarrassing to put them back) and you don't want to bring too little (since you'll be wasting your flex when the extra expires). 

You're one of two people. You either pull out your phone's calculator app, look at the prices around you, and start punching in numbers, or you're doing mental math and juggling carry digits around in your head. 

Instead, save yourself the time and the energy by having this calculator do the work for you, so you can get a spot in the long cashier line quickly and get back to your busy life!

## Users

This application is intended for Claremont Colleges students on the meal plan.

## MVP

The MVP must show a list of products (including a name and price) that is changeable by users, take in a user input of their amount of flex, and correctly calculate a shopping list of products to buy to minimize unspent flex. The MVP must also allow the user to specify which products that they prefer, so only their preferred items will show up in their shopping list.

## Functionality

The app is easy-to-use, configurable, fast, and effective.

From the home page ([http://localhost:3000](http://localhost:3000)), the user can view/change the list of products, make a new calculation, or make a new preference setting for which products they would like to buy.

![](https://puu.sh/zhsSh/0ffee2595d.png "Home page")

Clicking "All products" will lead to a list of products ([http://localhost:3000/products](http://localhost:3000/products)), which allows the users to add new products, make edits, or remove products.

![](https://puu.sh/zhsUB/39bbdfe7d3.png "All products")

Clicking "New product" will lead the user to a form ([http://localhost:3000/products/new](http://localhost:3000/products/new)) where they can contribute their own information to the list of products.

![](https://puu.sh/zhsYF/c3074f9c45.png "New product")

![](https://puu.sh/zht2R/7d1cd575af.png "All products, with banana")

The user can set their preferred products that they want on their shopping list by clicking "New preference" and filling out the form ([http://localhost:3000/preferences/new](http://localhost:3000/preferences/new)).

![](https://puu.sh/zht9y/b1f2e12c24.png "New preference")

Now, when the user clicks "New calculation" ([http://localhost:3000/calculations/new](http://localhost:3000/calculations/new)) and enters how much flex they have, the resulting shopping list will only include their preferred products.

![](https://puu.sh/zhtdA/b478f03f18.png "New calculation")

![](https://puu.sh/zhte3/b458c5fb45.png "Calculated result")

The preference setting used is the most recent one entered, so that the user doesn't have to specify their preferences every time.

The algorithm currently allows for repeated products in the shopping list.

## Installation Steps

The app uses Ruby 2.5.0p0 and Rails 5.1.4.

For local deployment, follow these instructions:

1. Install gem dependencies in `Gemfile` using: `$bundle install`

2. Create databases using: `$bin/rails db:migrate`

3. Run the server on port 3000 using: `$bin/rails server`

4. Navigate to [http://localhost:3000](http://localhost:3000).

## Issues

### Resolved Issues

During app development, there was an issue where I generated an `ActiveModel` called `Configuration`, which caused many errors due to `Configuration` actually being a built-in class. To resolve this, I renamed `Configuration` to `Preference`. This removed the errors.

Another issue was trying to figure out how to fit the list of preferred products into a single attribute in `Preference`, since there would otherwise have to be one attribute for each product in the `Products` database. This would have been inefficient since the user could add a large quantity of products to the database. To resolve this, I saved the array of preferred products in an attribute for text, but specified this text to be serializable.

### Known Bugs

The main issue still present is the lack of support for multiple users. For example, users are unable to save their *own* preference setting. Instead, the generated shopping list uses whatever preference was last created. So, current plan is to create an `ActiveModel` for users, where a `User` will be related to `Preferences` and their `Calculations` (their generated shoping lists) through a `has_many` relationship. This solution is not perfect since it doesn't use a log-in and a malicious user could remove other users' preference settings.

## References

_Active Record Validations — Ruby on Rails Guides._ (2018). _Guides.rubyonrails.org._ Retrieved 4 February 2018, from http://guides.rubyonrails.org/active\_record\_validations.html

_ActiveModel::Errors._ (2018). _Api.rubyonrails.org._ Retrieved 4 February 2018, from http://api.rubyonrails.org/classes/ActiveModel/Errors.html

_collection\_check\_boxes (ActionView::Helpers::FormOptionsHelper) - APIdock._ (2018). _Apidock.com._ Retrieved 4 February 2018, from https://apidock.com/rails/v4.0.2/ActionView/Helpers/FormOptionsHelper/collection\_check\_boxes

_Documentation for Ruby 2.0.0._ (2018). _Docs.ruby-lang.org._ Retrieved 4 February 2018, from https://docs.ruby-lang.org/en/2.0.0/

_Getting Started with Rails — Ruby on Rails Guides._ (2018). _Guides.rubyonrails.org._ Retrieved 4 February 2018, from http://guides.rubyonrails.org/getting_started.html

_Licensing a repository - User Documentation._ (2018). _Help.github.com._ Retrieved 4 February 2018, from https://help.github.com/articles/licensing-a-repository/

_How to add screenshot to READMEs in github repository?._ (2018). _Stackoverflow.com._ Retrieved 4 February 2018, from https://stackoverflow.com/questions/10189356/how-to-add-screenshot-to-readmes-in-github-repository

_Array Attribute for Ruby Model._ (2018). _Stackoverflow.com._ Retrieved 4 February 2018, from https://stackoverflow.com/questions/8097750/array-attribute-for-ruby-model