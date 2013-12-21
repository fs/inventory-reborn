@IA.module "Controllers_Application", (Mod, App, Backbone, Marionette, $, _) ->
  App.vent.on "authentication:logged_in", ->
    App.main.show App.layouts.main

  App.vent.on "authentication:logged_out", ->
    App.main.show App.layouts.unauthenticated


  Mod.on "before:start", (options) ->
    console.log "before:start"
    #App.currentUserr= null
    #if App.currentUser
    #  App.vent.trigger "authentication:logged_in"
    #else
    #  App.vent.trigger "authentication:logged_out"

  Mod.addInitializer ->
    console.log "ControllerModule starting up..."

  class App.Controllers.Application extends Backbone.Marionette.Controller

    index: ->
      console.log 'run logged in'
      App.vent.trigger "authentication:logged_in"
