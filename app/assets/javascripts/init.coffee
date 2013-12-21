@IA = do (Backbone, Marionette) ->
  App = new Marionette.Application()
  App.Views = {}
  App.Views.Layouts = {}
  App.Models = {}
  App.Collections = {}
  App.Controllers = {}
  App.Routers = {}
  App.Helpers = {}

  #Instantiated global layouts
  App.layouts = {}
  App.controllers = {}
  App.addRegions main: "#main"

  App

