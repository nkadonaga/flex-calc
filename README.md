# Flex-out Calculator

CS121 (Software Development) spring '18

Contributor(s): Natalie Kadonaga HMC '19 (nkadonaga)

Deployed application on Heroku: [https://flexcalc.herokuapp.com/](https://flexcalc.herokuapp.com/)


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

From the home page ([http://localhost:3000](http://localhost:3000)), the user can navigate to the form for a new calculation, the list of products, and the list of users.

![](https://puu.sh/zmAbL/b6a68580cf.png "Home page")

### Adding new products

Clicking "Products" will lead to a list of products ([http://localhost:3000/products](http://localhost:3000/products)), which allows the users to add new products, make edits, or remove products.

![](https://puu.sh/zmAfa/f40a8f7e35.png "All products")

Clicking "New product" will lead the user to a form ([http://localhost:3000/products/new](http://localhost:3000/products/new)) where they can contribute their own information to the list of products.

![](https://puu.sh/zmAh7/e692f7f05e.png "New product")

![](https://puu.sh/zmAih/34b1930df2.png "New product successfully created.")

![](https://puu.sh/zmAjb/80fa37033f.png "All products, with PBJ sandwich")

### Creating a new user

The user can set their preferred products that they want on their shopping list by clicking "Users" ([http://localhost:3000/users](http://localhost:3000/users)) then "New user" ([http://localhost:3000/users/new](http://localhost:3000/users/new)) and filling out the form.

![](https://puu.sh/zmArB/d00b7ced2c.png "Users page")

![](https://puu.sh/zmAxf/9b65d2dc7f.png "Empty new user form")

![](https://puu.sh/zmAyv/a7e240635d.png "Filled out form")

![](https://puu.sh/zmAzB/c6feb7a437.png "User creation successful")

![](https://puu.sh/zmAAG/4003df1400.png "New users list")

### Creating a new calculation

Now, when the user clicks "New calculation" ([http://localhost:3000/calculations/new](http://localhost:3000/calculations/new)) and enters how much flex they have with their ID number, the resulting shopping list will only include their preferred products.

![](https://puu.sh/zmACL/7f6a1825e1.png "New calculation")

![](https://puu.sh/zmAD8/7c52493a98.png "Calculated result")

The preference setting is saved to the user's ID number, so that the user doesn't have to specify their preferences every time.

The algorithm currently allows for repeated products in the shopping list.

## Installation Steps

The app uses Ruby 2.5.0p0 and Rails 5.1.4.

For local deployment, follow these instructions:

1. Clone the repository.

	```
	git clone https://github.com/nkadonaga/flex-calc
	```
2. Enter the repository directory.

	```
	cd flex-calc/
	```
3. Install gem dependencies in `Gemfile`.

	```
	bundle install --without production
	```
4. Run the database migration.

	```
	rails db:migrate
	```
5. Run the server on port 3000.

	```
	rails server
	```
6. Navigate to [http://localhost:3000](http://localhost:3000).

## Issues

### Resolved Issues

During app development, there was an issue where I generated an `ActiveModel` called `Configuration`, which caused many errors due to `Configuration` actually being a built-in class. To resolve this, I renamed `Configuration` to `Preference`. This removed the errors.

Another issue was trying to figure out how to fit the list of preferred products into a single attribute in `Preference`, since there would otherwise have to be one attribute for each product in the `Products` database. This would have been inefficient since the user could add a large quantity of products to the database. To resolve this, I saved the array of preferred products in an attribute for text.

I eventually removed `Preference` altogether and replaced it by including it as an attribute of the new `User` model. This allowed the app to support multiple users.

### Known Bugs

The main issues include:

1. There are no passwords, so any user could change anything in the database, from other users' information, to deleting the entire database. So, this product is far from production.
2. The user has to enter their ID any time they want to make a calculation.
3. There is a lack of user options. What if the user wanted to prevent repeated products in their shopping list? What if the user wanted to calculate a shopping list that would allow one to spend more than their flex left, so that they could pay the extra expense with Claremont Cash? There are many other options that could greatly enhance the program.

## References

_Active Record Validations — Ruby on Rails Guides._ (2018). _Guides.rubyonrails.org._ Retrieved 4 February 2018, from http://guides.rubyonrails.org/active\_record\_validations.html

_ActiveModel::Errors._ (2018). _Api.rubyonrails.org._ Retrieved 4 February 2018, from http://api.rubyonrails.org/classes/ActiveModel/Errors.html

_Array Attribute for Ruby Model._ (2017). _Stackoverflow.com._ Retrieved 4 February 2018, from https://stackoverflow.com/questions/8097750/array-attribute-for-ruby-model

_Collection\_check\_boxes (ActionView::Helpers::FormOptionsHelper) - APIdock._ (2017). _Apidock.com._ Retrieved 4 February 2018, from https://apidock.com/rails/v4.0.2/ActionView/Helpers/FormOptionsHelper/collection\_check\_boxes

_Documentation for Ruby 2.0.0._ (2018). _Docs.ruby-lang.org._ Retrieved 4 February 2018, from https://docs.ruby-lang.org/en/2.0.0/

_Getting Started with Rails — Ruby on Rails Guides._ (2014). _Guides.rubyonrails.org._ Retrieved 4 February 2018, from http://guides.rubyonrails.org/getting\_started.html

Hartl, M. (2016). _Ruby on Rails Tutorial (Rails 5). Softcover.io._ Retrieved 11 February 2018, from https://www.railstutorial.org/book/

_How to add screenshot to READMEs in github repository?._ (2012). _Stackoverflow.com._ Retrieved 4 February 2018, from https://stackoverflow.com/questions/10189356/how-to-add-screenshot-to-readmes-in-github-repository

_How to handle ActiveRecord::RecordNotFound in rails controller?._ (2013). _Stackoverflow.com._ Retrieved 12 February 2018, from https://stackoverflow.com/questions/12681524/how-to-handle-activerecordrecordnotfound-in-rails-controller

_Licensing a repository - User Documentation._ (2018). _Help.github.com._ Retrieved 4 February 2018, from https://help.github.com/articles/licensing-a-repository/

_Rails: redirect\_to with :error, but flash[:error] empty._ (2011). _Stackoverflow.com._ Retrieved 12 February 2018, from https://stackoverflow.com/questions/7510418/rails-redirect-to-with-error-but-flasherror-empty

_Rescue from ActiveRecord::RecordNotFound in Rails._ (2013). _Stackoverflow.com._ Retrieved 12 February 2018, from https://stackoverflow.com/questions/2336593/rescue-from-activerecordrecordnotfound-in-rails