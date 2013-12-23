define ['init', 'backbone.marionette', 'models/unit', 'models/local_storage'], (App, Marionette, Unit, Storage) ->
  class UnitView extends Marionette.ItemView
    template: "units/show"
    tagName: "tr"

  class UnitsView extends Marionette.CompositeView
    itemView: UnitView
    template: "units/index"
    itemViewContainer: "tbody"
    events:
      "click .add-unit": "addUnit"

    addUnit: (event) ->
      editView = new UnitEditView
        model: new Unit
        collection: @collection
      App.dialog.show editView

  class UnitEditView extends Backbone.Marionette.ItemView
    model: Unit
    template: 'units/edit'
    events:
      "click .close": "itemClosed"
      "click .create": "itemCreated"
      "click .model-footer .btn": "itemClosed"

    itemClosed: (event) ->
      event.preventDefault()
      @close()
    itemCreated: (event) ->
      event.preventDefault()
      new_unit = new Unit
      new_unit.set(this.getFormData(this.$el.find('form')))
      new_unit.save
        authentication_token: Storage.get("API_KEY")

      @close()

    fetchParams: (form) ->
      rawdata = $(form).serialize()
      rawdata

    getFormData: (form) ->
      unindexed_array = form.serializeArray()
      indexed_array = {}

      $.map(unindexed_array, (n, i) ->
        indexed_array[n['name']] = n['value']
      )

      indexed_array

  UnitsView
