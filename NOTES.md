#INITIAL SETUP:
- rails new rails-jeweler-designs
- cd into rails-jeweler-designs
- git init
- git add .
- git commit
- git remote add origin git@github.com:sascott624/rails-jeweler-designs.git
- git push -u origin master

- gem 'devise'
- rails generate devise:install
- #TODO -> define root in routes
        -> flash messages
        -> navbar in header with links to sign up, sign in, logout
- rails g devise User


#DATABASE:

User
=======================================
DEVISE
- add name, location columns

Design
=======================================
- user_id
- stone_id
- type
- metal
- price

Stone
=======================================
- name
- weight
- cost


#MODELS:

User
=======================================
has_many :designs
has_many :stones, through: :designs

- #TODO - add validations?

Design
=======================================
belongs_to :user
belongs_to :stone

- #TODO - add validations?

Stone
=======================================
has_many :designs
has_many :users, through: :designs

validates :name, :weight, :cost, presence: true


#CONTROLLERS & ACTIONS:

#VIEWS:
