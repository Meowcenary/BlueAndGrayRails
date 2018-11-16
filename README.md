# README Template and Ruby and Ruby on Rails Environment Configuration
# **Ruby version: 0.0.0**

# Dependencies
---
In order to generate an ERD quickly, you can use the ruby gem [rails-erd](https://github.com/voormedia/rails-erd)

# Initial Environment Configuration

### Installing Ruby
---

##### OSX
Two simple ways to install ruby are with homebrew or rvm. Installing with rvm is detailed at the
bottom of this section with the ruby version managers. For more on homebrew, [documenation](https://docs.brew.sh/Installation)

Ruby depends on xcode command line tools which can be installed by running the below in terminal

    xcode-select --install
Once xcode command line tools installs, install homebrew package manager. In terminal run


    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
after installation has completed, verify that homebrew is working. In terminal run

    brew doctor

Once hombrew is verified working, as an optional step consider puttting the directory homebrew uses to store its
executables at the front of the PATH environment variable. Doing this ensures that Homebrew installations will be
called over the tools that macOS includes. To do this, add the below line to ~/.bash_profile or ~/.bashrc

    export PATH=/usr/local/bin:$PATH
Be sure to reload the terminal or source the file, otherwise the change will not immediatel take effect.

If any version of ruby will do, run the following in terminal

    brew install ruby

For a specific version of ruby search homebrew packages with the following

    brew search ruby

And install replacing <desired_version_number> with the actual version number

    brew install ruby@<desired_version_number>

Choose a ruby version manager such as rvm, chruby, or rbenv. All of these will read .ruby-version files to switch
to the proper ruby version. Chruby and rbenv can both be installed using homebrew

    brew install chruby
    brew install rbenv

Rvm will need to be installed with instructions from it's [project site](https://rvm.io/rvm/install). Once it is
installed, installing just about any ruby version is pretty easy. Run the following in terminal replacing
<desired_version_number> with the actual version number

    rvm install <desired_version_number>
If the output mentions GPG keys are missing the ruby will still install, but the GPG key from the
[project site](https://rvm.io/rvm/install) should be installed asap.

##### Ubuntu, Debian, etc.
###### TODO

# MySQL Installation
---

##### OSX
If homebrew is not installed, reference the OSX instructions of the section 'Installing Ruby' for details on how to install.
If/when hombrew is installed run the following in terminal to install mysql. Be careful when upgrading versions of osx, mysql
and the rails gem mysql2 caused a lot of problems for me when upgrading to OSX HighSierra.
```
brew install mysql
brew services start mysql
```

To create the app user in mysql, run the following in terminal
```
 mysql --user=root mysql
   > CREATE USER '<desired_username>'@'localhost' IDENTIFIED BY '<desired_password>';
   > GRANT ALL PRIVILEGES ON *.* TO 'railsdev'@'localhost' WITH GRANT OPTION;
```

Restart your machine to complete the process. It's considerably easier to use a tool
such as mysql workbench compared to using the terminal.
[mysql workbench](https://www.mysql.com/products/workbench/)

# Rails Installation
---

# Initial Rails Configuration
---

# Deployment Instructions
---
###### TODO

# Running Tests
---
###### TODO

# Troubleshooting
---
### Disabling Spring
In terminal run

    pkill -f spring
Edit your Gemfile and comment out all the spring references.

In terminal run

    bin/spring binstub –remove –all
[sourced from here](http://fuzzyblog.io/blog/rails/2017/03/20/disabling-spring-in-rails.html)

### Resolving Gem Version Errors
Sometimes ruby gem versions get messed up and throw errors
similar to the one below

    LoadError: dlopen(/Users/Admin/.rvm/gems/ruby-2.5.1/gems/mysql2-0.4.9/lib/mysql2/mysql2.bundle, 9): Library not loaded: /usr/local/opt/mysql/lib/libmysqlclient.20.dylib
      Referenced from: /Users/Admin/.rvm/gems/ruby-2.5.1/gems/mysql2-0.4.9/lib/mysql2/mysql2.bundle
      Reason: image not found - /Users/Admin/.rvm/gems/ruby-2.5.1/gems/mysql2-0.4.9/lib/mysql2/mysql2.bundle

A potential solution for this is to disable spring and run the below command

    gem pristine --all
[gem pristine explained](https://www.justinweiss.com/articles/3-quick-gem-tricks/)

