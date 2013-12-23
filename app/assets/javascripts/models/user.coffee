define ['backbone', 'models/local_storage'], (Backbone, Storage) ->
  class User extends Backbone.Model
    urlRoot: 'users'
    defaults:
      email: ''
      full_name: ''
      password: ''

  User
