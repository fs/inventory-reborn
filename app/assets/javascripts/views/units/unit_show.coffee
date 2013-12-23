define ['init', 'backbone.marionette', 'models/unit', 'models/local_storage'], (App, Marionette, Unit, Storage) ->
  class UnitShowView extends Backbone.Marionette.ItemView
    model: Unit
    template: 'units/show_item'
    events:
      "click .close": "itemClosed"
      "click .model-footer .btn": "itemClosed"

    itemClosed: (event) ->
      event.preventDefault()
      @close()

  UnitShowView
