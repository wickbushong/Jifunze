# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - User has_many Lessons
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - Lesson belongs_to User (as :instructor or :student)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - :instructor has_many :students through Lessons, and vis versa
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - see above
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - Lesson has multiple user submittables
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - User and Lesson have necessary attribute presence validators
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - Lesson.available and User.instructors and User.students
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Omniauth/Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - /users/:id/lessons
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - /users/:id/lessons/new (for instructors)
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - validation errors included for log in, sign up, new lesson, and edit lesson

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate