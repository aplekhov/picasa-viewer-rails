picasa-viewer-rails
===================

A sample rails oauth app to view picasa albums and photos and add comments.
Based on [this](http://richonrails.com/articles/google-authentication-in-ruby-on-rails for details).

## Usage

    bundle install

then

    rake db:migrate

Add your own google secret key base and clientId, etc in `/config/initializers/secret_token.rb` and `/config/initializers/omniauth.rb`

Then 
    rails s

You will be asked to login with your google account and then allowed to see all your albums, photos and comment on photos.
