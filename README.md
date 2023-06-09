# SIMPLE-OMNIAUTH-APP
This is a simple omniauth app that involve signup/signin via facebook and google. The steps are clearly shown from start to finish.

Get started with the app:
```
git clone git@github.com:elibiz443/simple-omniauth-app.git && cd simple-omniauth-app && rails db:create db:migrate && bundle && bin/dev
```
###### NB// Make sure you update config/database.yml file with your own username and password

____
#### Requirements:
____
* ruby 3.2.2
* Rails 7.0.4.3
* psql (PostgreSQL) 14.7
* RSpec
* omniauth
* Tailwind CSS
____
1. Start the skeleton of the app: 
```
rails new simple-omniauth-app -T -d postgresql --css tailwind && cd simple-omniauth-app && subl .
```
2. Add bcrypt gem
3. Fire Up RSpec
In Gemfile, add:
```
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "factory_bot_rails", :require => false
  gem "faker"
  gem "database_cleaner-active_record"
end
```
In Terminal, Run:
```
bundle && rails g rspec:install
```

Create these folder and files, through running the following in terminal(in our app directory):
```
mkdir spec/support && touch spec/support/factory_bot.rb && touch spec/factories.rb
```
Configure FactoryBot by adding:
```
# spec/support/factory_bot.rb

require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  FactoryBot.find_definitions
end
```
Require support files in rails_helper.rb:
```
require_relative 'support/factory_bot'
```
In rails_helper.rb, uncomment:
```
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
```
When User model is generated (or any model) RSpec will generate a factory in factories.rb file. Modify it to look like:
```
# spec/factories.rb

FactoryBot.define do
end
```
Run Tests with:
```
rspec
```
4. create models
```
rails g model User provider uid name email image password_digest role && rails g model Home detail
```
5. Add model validations
6. Add Controllers
```
rails g controller sessions new && rails g controller home index
```
7. Update routes
8. Create & migrate DB then start server and tailwind:
```
rails db:create db:migrate && bin/dev
```
9. Go to localhost:3000
10. Add omniauth gem
----> Create Google and Facebook projects and fetch their API keys and secrets here.
Starting point to a new google project:
```
 https://console.cloud.google.com
 ```
 * Create Project
 * Go to APIs & Services > Oauth consent screen and choose External.
 * Next is go to APIs & Services > Credentials. At the top click CREATE CREDENTIALS and choose OAuth client ID.
 * Choose Web application as Application type.
 * Then add the callback URL to Authorized redirect URIs.
 * Then click Create. After creation, there should be a popup showing your client id and client secret. Save it for later use.

11. Add config/initializers/omniauth.rb file and update it as follows:
```
OmniAuth.config.logger = Rails.logger

facebook_key = Rails.application.credentials[:FACEBOOK][:FACEBOOK_KEY]
facebook_secret = Rails.application.credentials[:FACEBOOK][:FACEBOOK_SECRET]
google_key = Rails.application.credentials[:GOOGLE][:GOOGLE_KEY]
google_secret = Rails.application.credentials[:GOOGLE][:GOOGLE_SECRET]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,  facebook_key, facebook_secret
  provider :google_oauth2, google_key, google_secret
end
```
Use: (To edit Credentials)
```
EDITOR="subl --wait" rails credentials:edit
```
credentials file should be in the following format:
```
GOOGLE:
  GOOGLE_KEY: your_google_key
  GOOGLE_SECRET: your_google_secret
FACEBOOK:
  FACEBOOK_KEY: your_facebook_key
  FACEBOOK_SECRET: your_facebook_secret
```
12. Fire Up The Front-end
13. Write tests

###### That's it. Voilà. Happy coding 🙌 

##### Contacts:
* Email: elibiz443@gmail.com
* Phone/WhatsApp: +254768998781
