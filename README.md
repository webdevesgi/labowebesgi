Labo Web ESGI
========================

This is the repository of the [Labo Web ESGI association's website](http://labowebesgi.herokuapp.com).

# Requirements

**[[+](http://git-scm.com)]** Git

**[[+](https://rvm.io)]** Ruby 2, installed with [RVM](https://rvm.io) or [rbevn](http://rbenv.org)

**[[+](http://bundler.io)]** Bundler: `gem install bundler`

**[[+](http://rubyonrails.org)]** Rails 4 requirements: check on the Internet what does your OS need to install Ruby On Rails properly.

If you're using rbenv, don't forget to run `rbenv rehash` after installing gems.


# Installation

    git clone git@github.com:webdevesgi/labowebesgi.git && cd labowebesgi
    bundle install --without production


# Configuration

You'll need to create a `config/application.yml` file with all environment variables needed for the application. Check the [example file](https://github.com/webdevesgi/labowebesgi/blob/master/config/application.example.yml) out to fill it.

Then create your development and test databases with the folowing code:

    rake db:create
    rake db:migrate
    rake db:seed


# Launch

    rails s


# Test

    rspec spec

[Learn about RSpec](http://blog.davidchelimsky.net/blog/2007/05/14/an-introduction-to-rspec-part-i), the Ruby testing framework used on this application (with other amazin stuff).


# Contribute

- [Fork](https://help.github.com/articles/fork-a-repo) it
- [Write your code](https://help.github.com/articles/making-changes) on your own repository
- Submit a [pull-request](https://help.github.com/articles/using-pull-requests)


# Contributors

- Rémy Hannequin ([@rhannequin](https://github.com/rhannequin))
