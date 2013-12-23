define [
  'init',
  'backbone.marionette',
  'collections/units',
  'models/unit',
  'views/layouts/main'
  'views/units/units',
  'views/units/unit_show',
  'models/local_storage',
], (App,
  Marionette,
  Units,
  Unit
  Main,
  UnitsView,
  UnitShowView,
  Storage) ->

  App.module "UnitsCollection", (Mod) ->
    class UnitsController extends Marionette.Controller
      main: ->
        unitsCollection = new Units
        unitsCollection.fetch
          error: ->
            console.log "error"

          success: (collection) ->
            unitsView = new UnitsView
            unitsView.collection = unitsCollection
            App.main.currentView.content.show unitsView

          data: authentication_token: Storage.get("API_KEY")

      unit: (id) ->
        unitModel = new Unit(id: id)
        unitModel.fetch
          error: ->
            console.log "error"

          success: (unit) ->
            unitShowView = new UnitShowView
            unitShowView.model = unit
            App.main.currentView.content.show unitShowView

          data: authentication_token: Storage.get("API_KEY")

    class MainRouter extends Marionette.AppRouter
      appRoutes:
        'units': 'main'
        'units/:id': 'unit',

      controller: new UnitsController

    Mod.addInitializer ->
      new MainRouter

    @startWithParent = false

  App.UnitsCollection
