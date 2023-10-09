# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager for Ruby.
It is the primary way to install Ruby packages (know as Gems) for Ruby.

#### Install Gems

You need to create a Gemfile and define your Gems in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command

This will install the gems on the system globally

A Gemfile.lock will be created to lock down the gime version used in the project.

#### Executing ruby scripts in the context of bundler

We have to use `bundle exec` to tell furture ruby scripts to use the gems we installed.  This is the way we set context.

#### Sinatra

Sinatra is a micro web-framework for ruby to build we-apss.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file.

https://sinatrarb.com/

## Terratowns Mock Server

### Running the web server

We can run the web sedrver by executing the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.
