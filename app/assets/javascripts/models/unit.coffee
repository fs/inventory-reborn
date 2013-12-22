define ['backbone', 'models/local_storage'], (Backbone, Storage) ->
  class Unit extends Backbone.Model
    urlRoot: '/units'
    defaults:
      unit_type: ''
      inv_id: ''
      name: ''
      description: ''
      on_depot: ''
      out_of_order: ''
      out_of_order_note: ''
      location_id: ''
      user_id: ''

  Unit
