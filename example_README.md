# Project X

Project X's goal is to create a website with medicore functionality
but a VERY pretty front page teaser and intro video in order to gain
a ridiculous valuation as we attempt to raise money. Then we'll figure
out the actual features part.

## Development Setup

If you want to set this up for development, please follow the steps
below carefully:

1. Install MySQL and Apache with `port`
2. Move the `site.vhost.conf` file in the `dev` directory to the
   Apache configuration folder and reload Apache.
3. Run the `init_db.sql` file with the root MySQL user to setup the
   development user and database.
4. Run `bundle install` to install runtime language dependencies.
5. Migrate the database with `rake db:migrate`
6. Visit `localhost:3000` and see your website

## GOTCHAS!

* To run the cron jobs, run the ruby script directly to simulate it:

    ruby crons/open_wormhole.rb

* The background worker can be run as well using `rake worker`
* Video transcoding probably won't work since its a complex operation
  which only works on staging and production due to dependencies and
  paths.
