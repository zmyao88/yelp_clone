# Yelp Clone

This project is a web application based on Rails ``version 4.1.5`` and is a Yelp clone.


## Main functionality

Only registered users can create new restaurants using a form, specifying the name type of cuisine and a picture.

Users can leave reviews for restaurants with a numerical value between 1 and 5, the average rating is displayed by 5 stars. 

### Objectives

1. Creating Rails applications
1. The structure of Rails apps (MVC)
1. TDD on Rails, with RSpec & Capybara
1. Associations in Rails
1. Validations
1. AJAX in Rails

### Technologies used

1. Ruby on Rails
1. Devise
1. PaperClip
1. AWS SDK
1. Sass
1. Postgres
1. RSpec Rails
1. Capybara
1. Factory Girl
1. Poltergeist

### How to use

```ruby

# 1. Clone this repository

> git clone https://github.com/byverdu/yelp_clone.git


# 2. Go to that directory

> cd yelp_clone


# 3. Install all dependencies

> bundle install


# 4. Create test and development databases

> psql

CREATE DATABASE yelp_clone_development;
CREATE DATABASE yelp_clone_test;

\q


# 5. Create database migrations

> rake db:migration


# 6. Run the tests

> rspec -fd


# 7. Run the App

> rails s

=====================

visit 127.0.0.1:3000
```


