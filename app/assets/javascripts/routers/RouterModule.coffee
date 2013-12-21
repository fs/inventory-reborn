@IA.module "RouterModule", (Mod, App, Backbone, Marionette, $, _) ->
  Mod.addInitializer (options) ->
    console.log "RouterModule starting up..."

    Mod.router = new App.Routers.Router

    Backbone.history.start
      pushState: false
      root: '/'


  class App.Routers.Router extends Backbone.Marionette.AppRouter
    controller: new App.Controllers.Application

    initialize: (options) ->
      _.bindAll this
      console.log '@controller'
      console.log @controller.index

    appRoutes:
      "users" : 'index'
