# Funny Movie App

This simple app allow user to share a youtube movie, and write comments on a movie.

Anonymous user just can see the movie, can't share or write comment.

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
