define [
  'init',
  'backbone.marionette',
  'collections/units',
  'models/unit',
  'views/layouts/main'
  'views/units/units',
  'views/units/unit_show'
], (App,
  Marionette,
  Units,
  Unit
  Main,
  UnitsView,
  UnitShowView) ->

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

      unit: (id) ->
        unitModel = new Unit(id: id)
        unitModel.fetch
          error: ->
            console.log "error"

          success: (unit) ->
            console.log 'unit'
            console.log unit
            unitShowView = new UnitShowView
            unitShowView.model = unit
            console.log 'unitShowView.model'
            console.log unitShowView.model
            App.main.currentView.content.show unitShowView

    class MainRouter extends Marionette.AppRouter
      appRoutes:
        'units': 'main'
        'units/:id': 'unit',

      controller: new UnitsController

    Mod.addInitializer ->
      new MainRouter

    @startWithParent = false

  App.UnitsCollection
