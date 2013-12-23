define ['models/unit', 'models/local_storage'], (Unit, Storage) ->
  class Units extends Backbone.Collection
    model: Unit
    url: '/units'

  Units
