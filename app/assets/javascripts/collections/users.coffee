define ['models/user', 'models/local_storage'], (User, Storage) ->
  class Users extends Backbone.Collection
    model: User
    url: '/users'

  Users
