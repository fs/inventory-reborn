define ['models/unit', 'models/local_storage'], (Unit, Storage) ->
  class Units extends Backbone.Collection
    model: Unit
    url: '/units.json?authentication_token=' + Storage.get('API_KEY')

  Units
