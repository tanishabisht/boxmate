
# Chnage ruby version
- source ~/.bashrc
- rbenv local 2.6.6
- ruby --version

# Create new app
- rails new <name_of_the_app>

# Run our application
- rails s

# See all our routes
- rails routes

# Autogranerate code
- rails g controller login index
- STEP 1: rails g scaffold cheff day:string time:string cuisine:string meal:string price:float booked_num:integer max_num:integer
- STEP 2: rails db:migrate

- STEP 1: rails g scaffold customer day:string time:string cuisine:string meal:string price:float cheff_id:integer
- STEP 2: rails db:migrate

# push the created migrations
- rails db:migrate