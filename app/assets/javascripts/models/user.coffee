define ['backbone', 'models/local_storage'], (Backbone, Storage) ->
  class User extends Backbone.Model
    url: 'users.json?authenticity_token=' + Storage.get('API_KEY')
    defaults:
      email: ''
      full_name: ''
      password: ''

  User
