#!/bin/bash

# Delete old dummy app
rm -rf spec/dummy

# Generate new dummy app
CURRENT_DIR=$(pwd)
TEMP_DIR=$(mktemp -d)
cd $TEMP_DIR
rails --version
rails new dummy \
  --skip-git \
  --skip-bundle \
  -T \
  --javascript=importmap
mv dummy $CURRENT_DIR/spec/dummy
cd $CURRENT_DIR
rm -rf $TEMP_DIR

# Abort unless the dummy app was created successfully
if [ ! -d "spec/dummy" ]; then
  echo "Dummy app was not created successfully"
  exit 1
fi

# Proceed in the dummy app
cd spec/dummy

# Remove .ruby-version
rm .ruby-version

# In boot.rb use the Gemfile from the root directory
sed -i 's|../Gemfile|../../../Gemfile|' config/boot.rb

# Remove Gemfile*
rm Gemfile*

# install importmaps
bin/rails importmap:install

# Add simple_form-datetimepicker import to application.js
# echo 'import "simple_form-datetimepicker/application"' >> app/javascript/application.js

# install turbo-rails
bin/rails turbo:install

# Install simple_form
rails generate simple_form:install

# Install
rails generate simple_form:datetimepicker:install

# Setup dummy app
rails g scaffold Post title body:text published_at:timestamp --skip-test-framework
rails g factory_bot:model Post title body:text published_at:timestamp

# Copy setup/app/views/posts/_form.html.erb to spec/setup/app/views/posts/_form.html.erb
cp $CURRENT_DIR/spec/setup/app/views/posts/_form.html.erb app/views/posts/_form.html.erb

# Setup database
rails db:migrate db:test:prepare

# Create posts
bin/rails runner "require 'factory_bot_rails'; FactoryBot.create_list(:post, 10)"
