# README

The app development information present as below:
Ruby: 2.6.5, Rails: 5.2.4.5
OS: Windows-Subsystem-Linux(Ubuntu 18.04 LTS)
DB: PostgreSQL

* Make sure the tools in need has been already installed and version cannot older than app used. If you have problems in Ruby or Rails installation, instructions are elaborated in the end.

The following instructions are the steps to get the app up and running.
bundle install 				#install Rails gem files for app need.
npm install yarn 			#skip, if you’ve already installed yarn before.
yarn install -checkfiles		#install the libraries for front-end needs
yarn update 				#ensure that the libraries version is latest.
foreman start				#activate both rails server and webpack. 

Database creation, initialization:
If you foreman start(= rails server + bin/webpack-dev-server),
rails db:create								#Database creation.
bin/rails db:migrate RAILS_ENV=development	#Database initialization

#New Rails install: ActiveRecord::NoDatabaseError FATAL: role does not exist:
rails db:create	

#ActiveRecosrd::PendingMigrationError Migrations are pending. To resolve this issue, run: bin/rails db:migrate RAILS_ENV=development

* Ruby installation:
If you have not installed Ruby, Ruby Version Management (RVM) is recommendation for you, here’s an instruction for reference (https://rvm.io/).

* Rails installation: 
Ensure that installed Ruby already, then go ahead with this step.
gem install rails 			#install the latest Rails version
rails -v 				    #check Rails installation version
sudo apt-get install nodejs	 # Problems may be occurred when installing Rails, because there are some JS code in Rails be executed through node.js. Corresponding solution for this is installing node.js before installing Rails.

