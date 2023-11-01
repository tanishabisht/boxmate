
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
- rails g scaffold cheff day:string time:string cuisine:string meal:string price:number booked_num:number max_num:number