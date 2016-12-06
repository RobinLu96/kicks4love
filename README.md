# kicks4love

## Set up instruction

<ol>
<li>
<b>Ruby & Rails</b>
<ul>
<li>Make sure you have installed Ruby and Rails</li>
<li>Otherwise it will not work properly</li>
</ul>
</li>
<li>
<b>My Sql</b>
<ul>
<li>We are using MySql</li>
<li>Please install that as well</li>
</ul>
<li>
<b>Developer Guide</b>
<ul>
<li>Please create a new branch any time modifying the code</li>
<li>Unless being permitted to do so</li>
</ul>
</ol>
Check out this [Link](https://gorails.com/setup/osx/10.12-sierra) for more information for setting up environment
```bash
$ \curl -sSL https://get.rvm.io | bash -s stable    # get RVM
$ rvm requirements                                  # set up packages
$ rvm install 2.3.1                                 # install Ruby 2.3.1
$ gem install rails                                 # install Rails
```

##### Special notice for developing on Windows
- [Setting up Linux subsystem on Windows](https://gorails.com/setup/windows/10) is strongly recommended; after you've done so, simply repeat the setup procedure for Linux
- If you run into `"Error: Command 'rails' not recognized"` during generating controller pages, try
```bash
$ bundle install --binstubs                         # re-setup bundle
$ bundle config --delete bin                        # Re-configure
$ rake rails:update:bin                             # version control
$ git add bin

- [remember to start your mysql server everytime it runs]
command for starting service:
$ sudo service mysql start

- [generating database table using bash command line](http://edgeguides.rubyonrails.org/active_record_migrations.html)
 $ bin/rails generate migration CreateEntity (*note: have to use camel notation)
 this will generate a file in db/migration file, which you can use to define table in database
