# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) -
      - User has_many UserCalendars
      - User has_many Posts
      - Post has_many CalendarPosts
      - Post has_many PlatformPosts

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
      - Calendar belongs_to Admin, class_name => User
      - Post belongs_to User

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
      - Calendar has_many Users, through => UserCalendars
      - Calendar has_many Posts, through => CalendarPosts
      - Platform has_many Posts, through => PlatformPosts
      - Post has_many Calendars, through => CalendarPosts
      - Post has_many Platforms, through => PlatformPosts
      - User has_many Calendars, through => UserCalendars
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
      - User Submittable Attribute on CalendarPosts is :date and :time
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      - Calendar => validates_presence of :name
      - Post => validates_presence of :title
      - User => validates_uniqueness of :email
      - User => Validates password, case_sensitive true
      - User => validates password length
      - User => Validates presence of email, password and name
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup - Devise
- [x] Include login - Devise
- [x] Include logout - Devise
- [x] Include third party signup/login - Devise/Omniauth with Facebook
- [x] Include nested resource show or index -
        - Users/1/Calendars/1

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
        - Users/1/Calendars
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
