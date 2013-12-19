@IA = do (Backbone, Marionette) ->
  App = new Marionette.Application()
  App.Views = {}
  App.Views.Layouts = {}
  App.Models = {}
  App.Collections = {}
  App.Routers = {}
  App.Helpers = {}

  #Instantiated global layouts
  App.layouts = {}
  App.addRegions main: "#main"
  App.vent.on "authentication:logged_in", ->
    App.main.show App.layouts.main

  App.vent.on "authentication:logged_out", ->
    App.main.show App.layouts.unauthenticated

  App.bind "initialize:after", ->
    if App.currentUser
      App.vent.trigger "authentication:logged_in"
    else
      App.vent.trigger "authentication:logged_out"
  App

