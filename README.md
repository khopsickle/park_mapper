# Park Mapper

A mini park finder for San Francisco built in Rails by [khopsickle](https://github.com/khopsickle/).

## Deployed

- See it live on [Heroku](https://park-mapper.herokuapp.com/), may take a few seconds to load the inactive dyno.

- Features:
  - Search parks by zip code or list all
  - Sort and filter results by grades or acreage
  - Sign up to add parks to favorites
  - Admin account can refresh data from SF Open Data API

## Highlights

- [Soda-Ruby](https://github.com/socrata/soda-ruby) accesses the [San Francisco Open Data API](https://data.sfgov.org) to pull and save relevant park data to a PostgreSQL database
- [Figaro](https://github.com/laserlemon/figaro) for credentials management
- ActiveRecord queries are built to filter results on Park index page
- [Google Maps API](https://developers.google.com/maps/) to map parks

## Using this Repo

- After forking and cloning, setup an `application.yml` for credentials:
  - SF Open Data:
    - `APP_TOKEN`
    - `SECRET_TOKEN`
    - `DOMAIN`
  - `GOOGLE_API_KEY`
  - `ADMIN_PASSWORD` sets a password for the admin user
- Install and setup the db:
  - `bundle install`
  - `rails db:setup`
- Run the server and login as an admin:
  - Email: admin@admin.com
  - Password: *password you setup in applicaiton.yml*
- Visit `localhost:3000/refresh` - this hits the API to pull data into your application
