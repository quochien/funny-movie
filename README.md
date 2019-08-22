# Funny App

## Dependencies
* Ruby &#x2265; 2.5.1
* Rails &#x2265; 5.2.2
* PostgreSQL

## Testing

To run the test:

    $ rspec -fd

## Deployment Guide

Heroku deployment:

    $ git push heroku master

    $ heroku run rails db:migrate
