define ['models/user', 'models/local_storage'], (User, Storage) ->
  class Users extends Backbone.Collection
    model: User
    url: '/users.json?authentication_token=' + Storage.get('API_KEY')

  Users
